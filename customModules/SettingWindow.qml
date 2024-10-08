import QtQuick;
import QtQuick.Layouts;
import QtQuick.Controls.Basic;
import Qt5Compat.GraphicalEffects;

Item
{
    anchors.fill: parent;
    property int clickCount: 0;

    RowLayout
    {
        id: message;
        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 20;
        spacing: 10;

        IconText
        {
            id: returnImage;
            imageSource1: "qrc:/QML/ClientApp/icons/back_icon.png";
            height: 30
            width: height;

            onItemClicked: stackView.pop();
        }

        ColumnLayout
        {
            spacing: 3;
            Layout.fillWidth: true;

            Text
            {
                id: accountText;
                text: "Account";
                font.pixelSize: 16;
                font.bold: true;
                verticalAlignment: Text.AlignTop;
                elide: Text.ElideRight;
                Layout.fillWidth: true;
            }

            Text
            {
                id: text1;
                text: "Real Time information and Activities of your property";
                font.pixelSize: 12;
                color: "black";
                clip: true;
                wrapMode: Text.Wrap;
                verticalAlignment: Text.AlignTop;
                elide: Text.ElideRight;
                Layout.fillWidth: true;
            }
        }
    }

    Rectangle
    {
        width: parent.width;
        height: 1;
        color: "lightgray";
        anchors.top: message.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 10;

        DropShadow
        {
            anchors.fill: parent;
            color: "gray";
            radius: 2;
            samples: 16;
            horizontalOffset: 0;
            verticalOffset: 1;
        }
    }

    ColumnLayout
    {
        id: profile;
        anchors.top: message.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 20;
        spacing: 15;

        RowLayout
        {
            spacing: 20;
            Layout.fillWidth: true;

            RoundedImage
            {
                id: profileImage;
                imageSource: contact_list_model.main_user.image_url;
                width: 100;
                height: 100;
            }

            ColumnLayout
            {
                spacing: 10;
                Layout.fillWidth: true;
                Layout.alignment: Qt.AlignVCenter;

                Text
                {
                    text: "Profile Picture";
                    color: "black";
                    font.pixelSize: 14;
                    font.bold: true;
                    Layout.fillWidth: true;
                }

                Text
                {
                    text: "PNG, JPEG under 10 MB";
                    color: "black";
                    font.pixelSize: 12;
                    elide: Text.ElideRight;
                    Layout.fillWidth: true;
                }
            }

            ColumnLayout
            {
                spacing: 5;
                Layout.fillWidth: true;
                Layout.alignment: Qt.AlignVCenter;

                RowLayout
                {
                    spacing: 10;

                    RoundedImage
                    {
                        imageSource: "qrc:/QML/ClientApp/icons/upload_icon.png";
                        width: 40;
                        height: 40;
                    }

                    RoundedButton
                    {
                        text: "Upload";
                        color: "white";
                        Layout.fillWidth: true;

                        onClicked: media_controller.send_file(1);
                    }
                }

                RowLayout
                {
                    spacing: 10;

                    RoundedImage
                    {
                        imageSource: "qrc:/QML/ClientApp/icons/delete_icon.png";
                        width: 40;
                        height: 40;
                    }

                    RoundedButton
                    {
                        text: "Delete";
                        color: "white";
                        borderColor: "red";
                        Layout.fillWidth: true;

                        onClicked:
                        {
                            contact_list_model.main_user.image_url = "qrc:/QML/ClientApp/icons/name_icon.png";

                            client_manager.profile_image_deleted();
                        }
                    }
                }
            }
        }

        RowLayout
        {
            spacing: 20;
            Layout.fillWidth: true;

            InputField
            {
                id: settingsFirstName;

                image1Source: "qrc:/QML/ClientApp/icons/name_icon.png";
                echoMode: TextInput.Normal;
                placeHolder: contact_list_model.main_user.first_name;
                Layout.fillWidth: true;
                height: 40;
            }

            InputField
            {
                id: settingsLastName;

                image1Source: "qrc:/QML/ClientApp/icons/name_icon.png";
                echoMode: TextInput.Normal;
                placeHolder: contact_list_model.main_user.last_name;
                Layout.fillWidth: true;
                height: 40;
            }
        }
    }

    Rectangle
    {
        width: parent.width;
        height: 1;
        color: "lightgray";
        anchors.top: profile.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 10;

        DropShadow
        {
            anchors.fill: parent;
            color: "gray";
            radius: 2;
            samples: 16;
            horizontalOffset: 0;
            verticalOffset: 1;
        }
    }

    ColumnLayout
    {
        id: password;
        spacing: 10;
        anchors.margins: 20;
        anchors.top: profile.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        Layout.fillWidth: true;

        ColumnLayout
        {
            spacing: 3;

            Text
            {
                id: passwordText;
                text: "Password";
                font.pixelSize: 16;
                font.bold: true;
                verticalAlignment: Text.AlignTop;
                elide: Text.ElideRight;
                Layout.fillWidth: true;
            }

            Text
            {
                id: text2;
                text: "Modify your current Password";
                font.pixelSize: 12;
                color: "black";
                clip: true;
                wrapMode: Text.Wrap;
                verticalAlignment: Text.AlignTop;
                elide: Text.ElideRight;
                Layout.fillWidth: true;
            }
        }

        RowLayout
        {
            spacing: 20;
            Layout.fillWidth: true;

            InputField
            {
                id: settingsPassword;

                image1Source: "qrc:/QML/ClientApp/icons/hide_icon.png";
                image2Source: "qrc:/QML/ClientApp/icons/see_icon.png";
                echoMode: TextInput.Password;
                placeHolder: "New Password";
                Layout.fillWidth: true;
                height: 40;
            }

            InputField
            {
                id: settingsPasswordConfirmation;

                image1Source: "qrc:/QML/ClientApp/icons/hide_icon.png";
                image2Source: "qrc:/QML/ClientApp/icons/see_icon.png";
                echoMode: TextInput.Password;
                placeHolder: "Confirmation";
                Layout.fillWidth: true;
                height: 40;
            }
        }
    }

    Rectangle
    {
        width: parent.width;
        height: 1;
        color: "lightgray";
        anchors.top: password.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 10;

        DropShadow
        {
            anchors.fill: parent;
            color: "gray";
            radius: 2;
            samples: 16;
            horizontalOffset: 0;
            verticalOffset: 1;
        }
    }

    RowLayout
    {
        id: savingRow;
        spacing: 10;
        anchors.top: password.bottom;
        anchors.right: parent.right;
        anchors.rightMargin: 20;
        anchors.topMargin: 20;
        anchors.bottomMargin: 100;
        Layout.fillWidth: true;

        RoundedImage
        {
            id: saveImage;
            imageSource: "qrc:/QML/ClientApp/icons/save_icon.png";
            width: 40;
            height: 40;
        }

        RoundedButton
        {
            id: saveInfo;
            text: "Save Info";
            color: "white";
            Layout.fillWidth: true;
            height: 40;

            onClicked:
            {
                var valid = true;

                if (settingsFirstName.inputField === "" || settingsLastName.inputField === "")
                {
                    settingsFirstName.borderColor = settingsFirstName.inputField === "" ? "red" : settingsFirstName.inputField.focus ? "#a10e7a" : "black";
                    settingsLastName.borderColor = settingsLastName.inputField === "" ? "red" : settingsLastName.inputField.focus ? "#a10e7a" : "black";
                    valid = false;
                }
                else
                {
                    settingsFirstName.borderColor = settingsFirstName.inputField.focus ? "#a10e7a" : "black";
                    settingsLastName.borderColor = settingsLastName.inputField.focus ? "#a10e7a" : "black";
                }
    
                if (settingsPassword.inputField === "")
                {
                    settingsPassword.borderColor = "red";
                    valid = false;
                }
                else
                    settingsPassword.borderColor = settingsPassword.inputField.focus ? "#a10e7a" : "black";
    
                if (settingsPasswordConfirmation.inputField === "" || settingsPassword.inputField !== settingsPasswordConfirmation.inputField)
                {
                    settingsPasswordConfirmation.borderColor = "red";
                    valid = false;
                }
                else
                    settingsPasswordConfirmation.borderColor = settingsPasswordConfirmation.inputField.focus ? "#a10e7a" : "black";

                if(valid)
                {
                    client_manager.update_info(settingsFirstName.inputField, settingsLastName.inputField, settingsPassword.inputField);

                    contact_list_model.main_user.first_name = settingsFirstName.inputField;
                    contact_list_model.main_user.last_name = settingsLastName.inputField;
                }
            }
        }
    }

    Rectangle
    {
        width: parent.width;
        height: 1;
        color: "lightgray";
        anchors.top: savingRow.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 10;

        DropShadow
        {
            anchors.fill: parent;
            color: "gray";
            radius: 2;
            samples: 16;
            horizontalOffset: 0;
            verticalOffset: 1;
        }
    }

    RowLayout
    {
        id: deleteAccountRow;
        spacing: 10;
        anchors.top: savingRow.bottom;
        anchors.left: parent.left;
        anchors.leftMargin: 20;
        anchors.topMargin: 20;
        anchors.bottomMargin: 100;
        Layout.fillWidth: true;
        height: 100;

        RoundedImage
        {
            id: deleteAccountImage;
            imageSource: "qrc:/QML/ClientApp/icons/delete_account.png";
            width: 40;
            height: 40;
            visible: clickCount === 0;
        }

        RoundedButton
        {
            id: deleteAccount;
            text: "Delete Account";
            color: "white";
            borderColor: "red";
            Layout.fillWidth: true;
            height: 40;
            visible: clickCount === 0;

            onClicked:
            {
                if (clickCount === 0)
                {
                    client_manager.retrieve_question(contact_list_model.main_user.phone_number);
                    clickCount = 1;
                }
            }
        }

        ColumnLayout
        {
            visible: clickCount === 1;
            spacing: 5;
            width: 200;
            
            Text
            {
                id: secretQuestion;
                text: contact_list_model.main_user.secret_question;
                font.pixelSize: 14;
            }

            InputField
            {
                id: answer;
                image1Source: "qrc:/QML/ClientApp/icons/answer_icon.png";

                echoMode: TextInput.Normal;
                placeHolder: "Answer";
                width: parent.width;
                height: 40;
            }

            RoundedButton
            {
                id: confirmDeletion;
                text: "Confirm";
                color: "white";
                borderColor: "red";
                height: 40;
                width: 40;
                Layout.alignment: Qt.AlignRight;

                onClicked:
                {
                    if (clickCount === 1)
                    {
                        if (answer.inputField === contact_list_model.main_user.secret_answer)
                        {
                            client_manager.delete_account();
                            stackView.replace(loginWindow, StackView.PopTransition);
                            client_manager.disconnect();
                        }
                        else
                            answer.borderColor =  "red";
                    }
                }
            }
        }
    }

    Rectangle
    {
        width: parent.width;
        height: 1;
        color: "lightgray";
        anchors.top: deleteAccountRow.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.margins: 10;

        DropShadow
        {
            anchors.fill: parent;
            color: "gray";
            radius: 2;
            samples: 16;
            horizontalOffset: 0;
            verticalOffset: 1;
        }
    }

    RowLayout
    {
        id: logoutRow;
        spacing: 10;
        anchors.top: deleteAccountRow.bottom;
        anchors.topMargin: 50;
        anchors.horizontalCenter: parent.horizontalCenter;
        Layout.fillWidth: true;

        RoundedImage
        {
            id: logoutImage;
            imageSource: "qrc:/QML/ClientApp/icons/logout_icon.png";
            width: 50;
            height: 50;
        }

        RoundedButton
        {
            id: logout;
            text: "Log Out";
            color: "white";
            Layout.fillWidth: true;
            height: 50;

            onClicked:
            {
                stackView.replace(loginWindow, StackView.PopTransition);
                client_manager.disconnect();
            }
        }
    }
}