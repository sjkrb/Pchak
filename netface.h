#ifndef NETFACE_H
#define NETFACE_H

#include <QObject>
#include <curl/curl.h>

class NetFace : public QObject
{
    Q_OBJECT
public:
    explicit NetFace(QObject *parent = nullptr);
     Q_INVOKABLE QString search(QString var);
    ~NetFace();
signals:


public slots:
    void btnClick(int workNum);

private:

    CURL *curl;
    CURLcode res;

    //func
    static size_t writefunc(void *ptr, size_t size, size_t nmemb, QString *s) ;

};

#endif // NETFACE_H
