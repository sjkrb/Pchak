#ifndef DBHANDLER_H
#define DBHANDLER_H

#include <QObject>

class DbHandler : public QObject
{
    Q_OBJECT
public:
    explicit DbHandler(QObject *parent = nullptr);


signals:

public slots:
    void addPodcast(QString name , QString image , QString address);
    void removePodcast(QString name);
    void addEpisode(QString podname , QString episoneName);
    bool isSubscribed(QString name);
    void save();

private:
    QJsonDocument *m_db;
};

#endif // DBHANDLER_H
