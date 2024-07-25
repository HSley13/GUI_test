import QtQuick;
import QtQuick.Controls;

Column
{
    id: root;

    required property string imageSource;
    property string image2Source: "";
    required property string text;
    property int cWidth: 400 / 3;

    signal itemClicked();

    spacing: 2;
    width: cWidth;

    Rectangle
    {
        id: circle;

        height: 50 * 0.8;
        width: height;
        radius: width / 2;

        color: "transparent";
        
        anchors.horizontalCenter: parent.horizontalCenter;

        Image
        {
            id: profile;

            source: root.imageSource;
            mipmap: true;
            fillMode: Image.PreserveAspectFit;

            width: parent.width * 0.9;
            height: parent.height * 0.9;
            anchors.centerIn: parent;
        }

        MouseArea
        {
            anchors.fill: parent;

            onPressed: circle.color = "#ed7bb4";
            onReleased: circle.color = "transparent";
            onClicked: 
            {
                if(root.image2Source !== "")
                     profile.source = (profile.source.toString() === root.imageSource) ? root.image2Source : root.imageSource;

                root.itemClicked();
            }

        }
    }

    Text
    {
        id: label;
        text: root.text;

        color: "black";
        font.pixelSize: 10;

        anchors.horizontalCenter: parent.horizontalCenter;
    }
}