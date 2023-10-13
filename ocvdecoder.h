#ifndef OCVDECODER_H
#define OCVDECODER_H

#include <QObject>
#include <QtMultimedia/QVideoSink>
#include <QtMultimedia/QVideoFrame>
#include <QtQml>
#include <QFuture>
#include <opencv2/objdetect.hpp>

class OCVDecoder: public QObject
{
  Q_OBJECT
  QML_ELEMENT
  Q_PROPERTY(QVideoSink *videoSink READ videoSink WRITE setVideoSink NOTIFY videoSinkChanged)

public:
  OCVDecoder(QObject *parent = nullptr);
  ~OCVDecoder();
  void setVideoSink(QVideoSink *videoSink);
  bool isDecoding() { return m_decoding; }
  QVideoSink* videoSink() { return m_videoSink; }

public slots:
  void setFrame(const QVideoFrame &frame);

signals:
  void videoSinkChanged();
  void decoded(const QString &qr);

private:
  QVideoSink *m_videoSink;
  cv::QRCodeDetector m_qrDecoder;
  QFuture<void> m_processThread;
  bool m_decoding;
};


#endif // OCVDECODER_H
