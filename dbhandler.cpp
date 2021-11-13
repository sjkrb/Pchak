#include "dbhandler.h"

#include <QFile>
#include <QCoreApplication>
#include <QDebug>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

/*
 * {
 * podcasts : [
 *              {name : hidden brain , image : hidden_image , address : address} , ...
 *            ]
 * listened:{
 *              hidden_brain : ["something"," ... "],
 *              channelB: ["dastane lucy", ... ],
 *
 *          }
 * }
*/

DbHandler::DbHandler(QObject *parent) : QObject(parent)
{


    QFile file(qApp->applicationDirPath()+"/database.json");
    if(!file.open(QIODevice::ReadWrite))
        qDebug()<<"problem in loading file";
    QString filestr = file.readAll();

    QJsonParseError JsonParseError;
    if(filestr.isEmpty())
    {
        m_db = new QJsonDocument(QJsonDocument::fromJson(filestr.toUtf8(),&JsonParseError));
        QJsonObject rootObject = m_db->object();
        rootObject.insert("podcasts",QJsonArray());
        rootObject.insert("listened",QJsonObject());
        qDebug()<<rootObject;
        m_db->setObject(rootObject);
    }else
    {
        QJsonObject rootObject;
        m_db = new QJsonDocument(QJsonDocument::fromJson(filestr.toUtf8(),&JsonParseError));
    }
    file.close();
}

void DbHandler::addPodcast(QString name, QString image, QString address)
{

    QJsonObject rootObject = m_db->object();
    if(rootObject.contains("podcasts") && rootObject["podcasts"].isArray())
    {
        QJsonArray podArr = rootObject["podcasts"].toArray();
        QJsonObject obj;
        obj.insert("name",name);
        obj.insert("image",image);
        obj.insert("address",address);

        podArr.append(obj);

        rootObject.insert("podcasts",podArr);
        qDebug()<<"hello";
        m_db->setObject(rootObject);
    }
}

void DbHandler::removePodcast(QString name)
{

    QJsonObject rootObject = m_db->object();
    QJsonArray podArr = rootObject.value("podcasts").toArray();

    for (int i = 0; i < podArr.count(); ++i)
    {
        if(podArr.at(i).toObject().value("name").toString() == name)
        {
            podArr.removeAt(i);
            return;
        }
    }
    rootObject.insert("podcasts",podArr);
    qDebug()<<rootObject;
    m_db->setObject(rootObject);
}

void DbHandler::addEpisode(QString podname, QString episoneName)
{
    QJsonObject rootObject = m_db->object();
    QJsonObject obj = rootObject.value("listened").toObject();
    QJsonArray arr = obj.find(podname).value().toArray();
    arr.append(episoneName);
    obj.insert(podname,arr);
    rootObject.insert("listened",obj);
    qDebug()<<rootObject;
    m_db->setObject(rootObject);
}

bool DbHandler::isSubscribed(QString name)
{
    QJsonObject rootObject = m_db->object();
    for (int i = 0; i < rootObject.value("podcasts").toArray().count(); ++i) {
        if(rootObject.value("podcasts").toArray().at(i).toObject().value("name").toString() == name)
            return true;
    }
    return false;
}

void DbHandler::save()
{
    QFile file(qApp->applicationDirPath()+"/database.json");
    if(!file.open(QIODevice::WriteOnly|QIODevice::Truncate))
        qDebug()<<"problem in loading file";
    file.write(m_db->toJson());
    qDebug()<<"saved";
}



