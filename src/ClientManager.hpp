#pragma once

#include <QtQuick>
#include <QWebSocket>
#include <QtCompilerDetection>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif
class ClientManager : public QObject
{
    Q_OBJECT
    QML_ELEMENT

public:
    ClientManager(QObject *parent = nullptr);
    ClientManager(const ClientManager &) = delete;
    ClientManager &operator=(const ClientManager &) = delete;

    void get_user_time();
    void map_initialization();

    Q_INVOKABLE void sign_up(const int &phone_number, const QString &first_name, const QString &last_name, const QString &password, const QString &password_confirmation, const QString &secret_question, const QString &secret_answer);
    Q_INVOKABLE void login_request(const int &phone_number, const QString &password);
    void lookup_friend(const int &phone_number);
    Q_INVOKABLE void update_info(const QString &first_name, const QString &last_name, const QString &password);
    Q_INVOKABLE void update_password(const int &phone_number, const QString &password);
    Q_INVOKABLE void retrieve_question(const int &phone_number);

    Q_INVOKABLE void profile_image_deleted();
    Q_INVOKABLE void disconnect() { _socket->close(); };

    void update_profile(const QString &file_name, const QByteArray &file_data);
    void update_group_profile(const int &group_ID, const QString &file_name, const QByteArray &file_data);
    Q_INVOKABLE void send_text(const int &receiver, const QString &message, const int &chat_ID);
    void new_group(const QString &group_name, QJsonArray group_members);
    Q_INVOKABLE void send_group_text(const int &groupID, QString sender_name, const QString &message);
    void send_file(const int &chatID, const int &receiver, const QString &file_name, const QByteArray &file_data);
    void send_group_file(const int &groupID, const QString &sender_name, const QString &file_name, const QByteArray &file_data);
    Q_INVOKABLE void send_is_typing(const int &phone_number);
    Q_INVOKABLE void send_group_is_typing(const int &groupID, const QString &sender_name);

    void remove_group_member(const int &groupID, QJsonArray group_members);
    void add_group_member(const int &groupID, QJsonArray group_members);

    static QString UTC_to_timeZone(const QString &UTC_time);

    Q_INVOKABLE void delete_message(const int &phone_number, const int &chat_ID, const QString &full_time);
    Q_INVOKABLE void delete_group_message(const int &groupID, const QString &full_time);

    void update_unread_message(const int &chatID);
    void update_group_unread_message(const int &groupID);

    Q_INVOKABLE void delete_account();

    void send_audio(const int &chatID, const int &receiver, const QString &audio_name, const QByteArray &audio_data);
    void send_group_audio(const int &groupID, const QString &sender_name, const QString &audio_name, const QByteArray &audio_data);

public slots:
    void on_text_message_received(const QString &data);
    void on_disconnected();

signals:
    void load_contacts(QJsonArray contacts);
    void load_groups(QJsonArray json_array);
    void load_my_info(QJsonObject my_info);

    void profile_image(const QString &image_url);
    void group_profile_image(const int &group_ID, const QString &image_url);

    void text_received(const int &chatID, const int &sender_ID, const QString &message, const QString &time);

    void client_connected(const int &phone_number);
    void client_disconnected(const int &phone_number);

    void client_profile_image(const int &phone_number, const QString &image_url);

    void group_ID(const int &groupID, const QString &group_name);
    void group_text_received(const int &groupID, const int &sender_ID, QString sender_name, const QString &message, const QString &time);

    void file_received(const int &chatID, const int &sender_ID, const QString &file_url, const QString &time);
    void group_file_received(const int &groupID, const int &sender_ID, const QString &sender_name, const QString &file_url, const QString &time);

    void is_typing_received(const int &sender_ID);
    void group_is_typing_received(const int &groupID, const QString &sender_name);

    void update_client_info(const int &phone_number, const QString &first_name, const QString &last_name);
    void disconnected();

    void question_answer(const QString &secret_question, const QString &secret_answer);
    void status_message(const QString &message, const bool &true_or_false);
    void message_received(const QString &message);

    void remove_group_member_received(const int &groupID, QJsonArray group_members);
    void add_group_member_received(const int &groupID, const QJsonArray new_group_members);

    void removed_from_group(const int &groupID);
    void delete_message_received(const int &chatID, const QString &full_time);
    void delete_group_message_received(const int &groupID, const QString &full_time);

    void audio_received(const int &chatID, const int &sender_ID, const QString &audio_url, const QString &time);
    void group_audio_received(const int &GroupID, const int &sender_ID, const QString &sender_name, const QString &audio_url, const QString &time);

public:
    static std::shared_ptr<ClientManager> instance();

private:
    static inline QWebSocket *_socket{nullptr};
    static inline QString _time_zone{};
    static inline std::shared_ptr<ClientManager> _instance{nullptr};

    enum MessageType
    {
        SignUp = Qt::UserRole + 1,
        Text,
        GroupText,
        ProfileImage,
        GroupProfileImage,
        ClientProfileImage,
        ClientDisconnected,
        ClientConnected,
        AddedYou,
        LookupFriend,
        AddedToGroup,
        File,
        GroupFile,
        LoginRequest,
        IsTyping,
        UpdateInfo,
        RetrieveQuestion,
        QuestionAnswer,
        GroupIsTyping,
        RemoveGroupMember,
        AddGroupMember,
        RemovedFromGroup,
        DeleteMessage,
        DeleteGroupMessage,
        Audio,
        GroupAudio
    };
    static inline QHash<QString, MessageType> _map{};
};