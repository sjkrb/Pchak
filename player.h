#ifndef PLAYER_H
#define PLAYER_H

#include <QMediaPlayer>

class Player : public QMediaPlayer
{
    Q_OBJECT
public:
    explicit Player(QObject *parent = nullptr);

public slots:
    void _onDurationChanged(qint64 duration);
    void _onPositionChanged(qint64 position);
    void _onMetaDataChanged();
    void _onMediaStatusChanged(QMediaPlayer::MediaStatus status);

signals:

};

#endif // PLAYER_H
