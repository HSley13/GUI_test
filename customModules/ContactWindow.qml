import QtQuick;
import QtQuick.Controls;
import QtQuick.Layouts;

Rectangle
{
    id: root;

    Rectangle
    {
        id: contactHeader;
        width: parent.width;
        height: 50;

        IconText
        {
            id: returnImage;
            imageSource1:"qrc:/QML/ClientApp/icons/back_icon.png";
            height: parent.height * 0.5;
            width: height;

            onItemClicked: stackView.pop();

            anchors.verticalCenter: parent.verticalCenter;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
        }

        InputField
        {
            id: contactSearch;
            image1Source: "qrc:/QML/ClientApp/icons/search_icon.png";
            echoMode: TextInput.Normal;
            placeHolder: "Search...";
            width: parent.width * 0.6;
            height: 40;

            onAccepted: (value) => 
            {
                console.log("Text Searched: " + value);
            }

            anchors.top: parent.top;
            anchors.topMargin: 10;
            anchors.horizontalCenter: parent.horizontalCenter;
        }

        IconText
        {
            id: menu;
            imageSource1: "qrc:/QML/ClientApp/icons/menu_icon.png";
            imageSource2: "qrc:/QML/ClientApp/icons/cancel_menu.png";
            height: parent.height * 0.5;
            width: height;

            onItemClicked:
            {
                menuPanel.hidden = !menuPanel.hidden;
                (dialog.open()) ? dialog.close() : dialog.open();

                console.log("Menu Clicked");
            }

            anchors.verticalCenter: parent.verticalCenter;
            anchors.right: parent.right;
            anchors.rightMargin: menuPanel.hidden ? 10 : menuPanel.width;
        }
    }

    Rectangle
    {
        width: parent.width;
        anchors.top: contactHeader.bottom;
        anchors.bottom: contactBottom.top;

        StackView
        {
            id: stackView2;
            anchors.fill: parent;

            initialItem: contactList;

            ListDialog
            {
                id: dialog;
                input: true;
                title: "Hello World";
                width: 300;

                names: ["Are you sure you want to delete it?"];

                onDialogAccepted:
                {
                    console.log("Dialog Accepted");
                    console.log("input: " + dialog.inputField);
                }

                onDialogRejected:
                {
                    console.log("Dialog Rejected");
                    console.log("input: " + dialog.inputField);
                }

                anchors.centerIn: parent;
            }
        }
    }

    Rectangle 
    {
        id: contactBottom;
        width: parent.width;
        height: 50;

        gradient: Gradient
        {
            GradientStop { position: 0.0; color: "gray"; }
            GradientStop { position: 1.0; color: "white"; }
        }

        IconText
        {
            id: chatList;
            imageSource1: "qrc:/QML/ClientApp/icons/chat_icon.png";
            label: "Chats";
            height: parent.height * 0.9;
            width: height;

            onItemClicked:
            {
                stackView2.pop();
                console.log("Chat Icon Clicked");
            }

            anchors.left: parent.left;
            anchors.leftMargin: 10;
            anchors.verticalCenter: parent.verticalCenter;
        }

        IconText
        {
            id: chatGroup;
            imageSource1: "qrc:/QML/ClientApp/icons/group_icon.png";
            label: "Groups";
            height: parent.height * 0.9;
            width: height;

            onItemClicked:
            {
                stackView2.push(groupList)
                console.log("Group Icon Clicked");
            }

            anchors.centerIn: parent;
        }

        IconText
        {
            id: profile;
            imageSource1: "qrc:/QML/ClientApp/icons/settings_icon.png";
            label: "Profile";
            height: parent.height * 0.9;
            width: height;

            onItemClicked:
            {
                stackView.push(settingWindow);
                console.log("Profile Icon Clicked");
            }

            anchors.right: parent.right;
            anchors.rightMargin: 10;
            anchors.verticalCenter: parent.verticalCenter;
        }

        anchors.bottom: parent.bottom;
    }

    MenuPanel 
    {
        id: menuPanel;
        anchors.right: menu.left;
        anchors.top: menu.bottom;

        Component.onCompleted:
        {
            var options = [
                {text: "New Conversation", image_source: "qrc:/QML/ClientApp/icons/chat_icon.png"},
                {text: "New Group", image_source: "qrc:/QML/ClientApp/icons/group_icon.png"}
            ];
            
            menuPanel.update_options(options);
        }

        x: hidden ? parent.width : parent.width - width;
    }
}