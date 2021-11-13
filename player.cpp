#include "player.h"
#include <QMediaPlayer>

Player::Player(QObject *parent) : QMediaPlayer(parent)
{
    connect(this, &QMediaPlayer::durationChanged, this, &Player::_onDurationChanged);
    connect(this, &QMediaPlayer::positionChanged, this, &Player::positionChanged);
    connect(this, QOverload<>::of(&QMediaPlayer::metaDataChanged), this, &Player::_onMetaDataChanged);
    connect(this, &QMediaPlayer::mediaStatusChanged, this, &Player::statusChanged);
    connect(this, &QMediaPlayer::bufferStatusChanged, this, &Player::bufferingProgress);
    connect(this, &QMediaPlayer::videoAvailableChanged, this, &Player::videoAvailableChanged);
    connect(this, QOverload<QMediaPlayer::Error>::of(&QMediaPlayer::error), this, &Player::displayErrorMessage);
    connect(this, &QMediaPlayer::stateChanged, this, &Player::stateChanged);
}
