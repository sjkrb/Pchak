#include "netface.h"
#include <QDebug>
#include <QJsonDocument>
NetFace::NetFace(QObject *parent) : QObject(parent)
{
    curl_global_init(CURL_GLOBAL_DEFAULT);
    curl = curl_easy_init();
}

QString NetFace::search(QString var)
{
    QString buffer;
    var = var.replace(" ","+");
    QString search = QString("https://itunes.apple.com/search?term=%1&media=podcast&entry=podcast&attribute=titleTerm").arg(var);
    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, search.toStdString().c_str());
        //            curl_easy_setopt(curl, CURLOPT_URL, "https://www.aparat.com");

        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L); //only for https
        curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L); //only for https
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buffer);
        //          curl_easy_setopt (curl, CURLOPT_VERBOSE, 1L);
    }

    res = curl_easy_perform(curl);
    qDebug()<<buffer;
    if(res != CURLE_OK)
        qDebug()<< "curl_easy_perform() failed:"<<curl_easy_strerror(res);
    return buffer;
}

NetFace::~NetFace()
{
    curl_easy_cleanup(curl);

    curl_global_cleanup();
}

void NetFace::btnClick(int workNum)
{
    qDebug()<<"hatalmas"<<workNum;

    switch (workNum) {
    case 0:
        break;
    case 1:
        break;
    case 2:
        break;
    case 3:
        break;
    case 4:
    {
//        QString buffer;
//        if(curl) {
//            curl_easy_setopt(curl, CURLOPT_URL, "https://itunes.apple.com/search?term=hidden+brain&media=podcast&entry=podcast&attribute=titleTerm");
//            //            curl_easy_setopt(curl, CURLOPT_URL, "https://www.aparat.com");

//            curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L); //only for https
//            curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L); //only for https
//            curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
//            curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buffer);
//            //          curl_easy_setopt (curl, CURLOPT_VERBOSE, 1L);
//        }

//        res = curl_easy_perform(curl);
//        qDebug()<<buffer;
//        if(res != CURLE_OK)
//            qDebug()<< "curl_easy_perform() failed:"<<curl_easy_strerror(res);
        break;
    }
    case 5:
        break;
    case 6:
        break;
    case 7:
        break;
    default:
        break;
    }
}

size_t NetFace::writefunc(void *ptr, size_t size, size_t nmemb, QString *s)
{
    s->append((char*)ptr);
    return size*nmemb;
}
