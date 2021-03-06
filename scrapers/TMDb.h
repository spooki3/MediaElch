#ifndef TMDB_H
#define TMDB_H

#include <QComboBox>
#include <QObject>
#include <QPointer>
#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>

#include "data/ScraperInterface.h"

/**
 * @brief The TMDb class
 */
class TMDb : public ScraperInterface
{
    Q_OBJECT
public:
    explicit TMDb(QObject *parent = nullptr);
    ~TMDb() override;
    QString name() override;
    QString identifier() override;
    void search(QString searchStr) override;
    void loadData(QMap<ScraperInterface *, QString> ids, Movie *movie, QList<int> infos) override;
    bool hasSettings() override;
    void loadSettings(QSettings &settings) override;
    void saveSettings(QSettings &settings) override;
    QList<int> scraperSupports() override;
    QList<int> scraperNativelySupports() override;
    QWidget *settingsWidget() override;
    static QList<ScraperSearchResult> parseSearch(QString json, int *nextPage, int page);
    static QString apiKey();
    bool isAdult() override;

signals:
    void searchDone(QList<ScraperSearchResult>) override;

private slots:
    void searchFinished();
    void loadFinished();
    void loadCastsFinished();
    void loadTrailersFinished();
    void loadImagesFinished();
    void loadReleasesFinished();
    void setupFinished();

private:
    QNetworkAccessManager m_qnam;
    QString m_language;
    QString m_language2;
    QString m_baseUrl;
    QMutex m_mutex;
    QList<int> m_scraperSupports;
    QList<int> m_scraperNativelySupports;
    QWidget *m_widget;
    QComboBox *m_box;

    QNetworkAccessManager *qnam();
    void setup();
    void parseAndAssignInfos(QString json, Movie *movie, QList<int> infos);
};

#endif // TMDB_H
