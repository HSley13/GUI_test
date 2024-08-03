import QtQuick;
import QtQuick.Controls;

Rectangle
{
    ListView
    {
        id: contactListView;

        width: parent.width;
        height: parent.height;

        anchors.margins: 5;

        spacing: 5;
        clip: true;

        model: contact_list_model.contact_proxy_list;

        delegate: ContactListDelegate 
        {
            width: parent.width;
            height: 50;
        }
    }
}