#pragma once

#include <QtQuick>
#include "GroupInfo.h"
#include "GroupProxyList.h"

class GroupListModel : public QAbstractListModel
{
    Q_OBJECT
    QML_ELEMENT

    Q_PROPERTY(GroupInfo *active_group_chat READ active_group_chat WRITE set_active_group_chat NOTIFY active_group_chat_changed)
    Q_PROPERTY(GroupProxyList *group_proxy_list READ group_proxy_list)

public:
    enum GroupRoles
    {
        GroupIDRole = Qt::UserRole + 1,
        MemberListRole,
        GroupNameRole,
        GroupUnreadMessageRole,
        GroupImageUrlRole,
        GroupMessagesRole,
        GroupObjectRole
    };

    GroupListModel(QAbstractListModel *parent = nullptr);

    const QList<GroupInfo *> &groups() const;
    void set_groups(const QList<GroupInfo *> &new_groups);

    GroupProxyList *group_proxy_list() const;

    GroupInfo *active_group_chat() const;
    void set_active_group_chat(GroupInfo *new_group_chat);

    virtual int rowCount(const QModelIndex &parent) const override;
    virtual QVariant data(const QModelIndex &index, int role) const override;
    virtual QHash<int, QByteArray> roleNames() const override;
    virtual bool setData(const QModelIndex &index, const QVariant &value, int role) override;

private:
    QList<GroupInfo *> _groups;
    GroupInfo *_active_group_chat{};

    GroupProxyList *_group_proxy_list{};

private slots:
    void on_group_send_message(const QString &group_message);

signals:
    void groups_changed();
    void active_group_chat_changed();

    void group_send_message(const QString &group_message);
};