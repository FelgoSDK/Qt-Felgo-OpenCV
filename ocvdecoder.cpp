#include "ocvdecoder.h"
#include <QUrl>
#include <QtConcurrent/QtConcurrent>
#include <opencv2/imgproc.hpp>


OCVDecoder::OCVDecoder(QObject *parent): QObject(parent), m_decoding(false)
{
}

OCVDecoder::~OCVDecoder()
{
  if (m_processThread.isRunning()) {
    m_processThread.waitForFinished(); // wait for finish thread
  }
}

void OCVDecoder::setFrame(const QVideoFrame &frame)
{
  if (!isDecoding() && m_processThread.isFinished()) {
    m_decoding = true;
    QImage image = frame.toImage().convertToFormat(QImage::Format_RGB32).rgbSwapped();

    m_processThread = QtConcurrent::run([=]() {

      if (image.isNull()) {
        m_decoding = false;
        return;
      }

      cv::Mat img(image.height(), image.width(), CV_8UC4, (void *) image.bits(), image.bytesPerLine());

      std::vector<std::string> decoded_info;
      cv::OutputArray& points = cv::noArray();
      cv::OutputArrayOfArrays straight_qrcode = cv::noArray();
      bool data = m_qrDecoder.detectAndDecodeMulti(img, decoded_info, points, straight_qrcode);
      if (data) {
        std::string qrTextResult;
        for (size_t i = 0; i < decoded_info.size(); ++i) {
          qrTextResult += decoded_info[i];
        }
        QString result(QString::fromStdString(qrTextResult));
        if (!result.isEmpty())
        {
          emit decoded(result);
        }
      }
      m_decoding = false;
    });
  }

}

void OCVDecoder::setVideoSink(QVideoSink *videoSink)
{
  if (m_videoSink == videoSink)
    return;

  m_videoSink = videoSink;
  if (m_videoSink) {
    QObject::connect(m_videoSink, &QVideoSink::videoFrameChanged,
                     this, &OCVDecoder::setFrame);
  }

  emit videoSinkChanged();
}


// https://asmaloney.com/2013/11/code/converting-between-cvmat-and-qimage-or-qpixmap/

static cv::Mat QImageToCvMat(QImage inImage, bool inCloneImageData = true)
{
  switch (inImage.format())
  {
  // 8-bit, 4 channel
  case QImage::Format_ARGB32:
  case QImage::Format_ARGB32_Premultiplied:
  {
    cv::Mat mat(inImage.height(), inImage.width(),
                CV_8UC4,
                const_cast<uchar*>(inImage.bits()),
                static_cast<size_t>(inImage.bytesPerLine())
                );

    return inCloneImageData ? mat.clone() : mat;
  }

    // 8-bit, 3 channel
  case QImage::Format_RGB32:
  {
    if (!inCloneImageData) {
      qWarning() << "QImageToCvMat() - Conversion requires cloning so we don't modify the original QImage data";
    }

    cv::Mat mat(inImage.height(), inImage.width(),
                CV_8UC4,
                const_cast<uchar*>(inImage.bits()),
                static_cast<size_t>(inImage.bytesPerLine())
                );

    cv::Mat matNoAlpha;

    cv::cvtColor(mat, matNoAlpha, cv::COLOR_BGRA2BGR); // drop the all-white alpha channel

    return matNoAlpha;
  }

    // 8-bit, 3 channel
  case QImage::Format_RGB888:
  {
    if (!inCloneImageData) {
      qWarning() << "QImageToCvMat() - Conversion requires cloning so we don't modify the original QImage data";
    }

    QImage swapped = inImage.rgbSwapped();

    cv::Mat mat(swapped.height(), swapped.width(),
                CV_8UC3,
                const_cast<uchar*>(swapped.bits()),
                static_cast<size_t>(swapped.bytesPerLine())
                );
    return inCloneImageData ? mat.clone() : mat;
  }

    // 8-bit, 1 channel
  case QImage::Format_Grayscale8:
  case QImage::Format_Indexed8:
  {
    cv::Mat mat(inImage.height(), inImage.width(),
                CV_8UC1,
                const_cast<uchar*>(inImage.bits()),
                static_cast<size_t>(inImage.bytesPerLine())
                );

    return inCloneImageData ? mat.clone() : mat;
  }


#if QT_VERSION >= QT_VERSION_CHECK(5, 13, 0)
  case QImage::Format_Grayscale16:
  {
    cv::Mat mat(cv::Size(inImage.width(),inImage.height()),CV_16U,const_cast<uchar*>(inImage.bits()),cv::Mat::AUTO_STEP);
    return inCloneImageData ? mat.clone() : mat;
  }
#endif

  default:
    qWarning() << "QImageToCvMat() - QImage format not handled in switch:" << inImage.format();
    break;
  }

  return cv::Mat();
}
