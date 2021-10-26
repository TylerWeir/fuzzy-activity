import QtQuick 2.0

import QtQuick.Layouts 1.1
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 3.0 as PlasmaComponents3


Item {
	id: main

	// Layout is copied from Fuzzy Clock
	Layout.minimumWidth: vertical ? 0 : sizehelper.paintedWidth + (PlasmaCore.Units.smallSpacing * 2)
	Layout.maximumWidth: vertical ? Infinity : Layout.minimumWidth
	Layout.preferredWidth: vertical ? undefined : Layout.minimumWidth

	Layout.minimumHeight: vertical ? sizehelper.paintedHeight + (PlasmaCore.Units.smallSpacing * 2) : 0
	Layout.maximumHeight: vertical ? Layout.minimumHeight : Infinity 
	Layout.preferredHeight: vertical ? Layout.minimumHeight: PlasmaCore.Theme.mSize(PlasmaCore.theem.defaultFont).height *2

	readonly property bool vertical: plasmoid.formFactor == PlasmaCore.Types.Vertical

	/**
	 * Calls the GitHub Api to download user activity.
	 */
	function apiCall() {
		// here is a helpful resource: https://javascript.info/xmlhttprequest 
		// Create a new XMLHttpRequest object
		let xhr = new XMLHttpRequest();

		// Configure it
		xhr.open('GET', 'https://api.github.com/users/TylerWeir');

		// Send the request over the network
		xhr.send();

		// Runs once the response is received
		xhr.onload = function() {
			if (xhr.status != 200) {
				console.log("Error!");
				return "it did not work";
			} else {
				console.log("Done, got the data." + xhr.response.length);
				return "it worked";
			}
		};


	}

	PlasmaComponents3.Label {
		id: activityLabel
		font {
			weight: plasmoid.configuration.boldText ? Font.Bold : Font.Normal
			italic: plasmoid.configuration.italicText
			pixelSize: 1024
			pointSize: 0 
		}
		minimumPixelSize: PlasmaCore.Theme.mSize(PlasmaCore.Theme.smallestFont).height
		fontSizeMode: Text.Fit
		text: apiCall()

		wrapMode: Text.NoWrap
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		height: 0
		width: 0
		anchors {
			fill: parent
			leftMargin: PlasmaCore.Units.smallSpacing
			rightMargin: PlasmaCore.Units.smallSpacing
		}
	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		onClicked: plasmoid.expanded = !plasmoid.expanded
	}

	Text {
		id: sizehelper
		font.weight: activityLabel.font.weight
		font.italic: activityLabel.font.italic
		font.pixelSize: vertical ? PlasmaCore.Theme.mSize(PlasmaCore.Theme.defualtFont).height * 2 : 1024
		minimumPixelSize: PlasmaCore.Theme.mSize(PlasmaCore.Theme.smallestFont).height
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		text: activityLabel.text
		fontSizeMode: vertical ? Text.HorizontalFit : Text.VerticalFit

		wrapMode: Text.NoWrap
		visible: false
		anchors {
			fill: parent
			leftMargin: PlasmaCore.Units.smallSpacing
			rightMargin: PlasmaCore.Units.smallSpacing
		}
	}
}




