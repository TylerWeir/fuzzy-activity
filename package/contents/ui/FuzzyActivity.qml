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
	Layout.preferredHeight: vertical ? Layout.minimumHeight: Plasmacore.Theme.mSize(PlasmaCore.theem.defaultFont).height *2

	readonly property bool vertical: plasmoid.formFactor == PlasmaCore.Types.Vertical

	/**
	 * Calls the GitHub Api to download user activity.
	 */
	function apiCall() {
		var req = new XMLHttpRequest();
		req.open("GET", "http://api.github.com/users/TylerWeir/events");
		req.onload = function() {
			var objectArray = JSON.parse(req.responseText);
			if (objectArray.errors !== undefined) {
				console.log("Error fecthing activity: " + objectArray.errors[0].messsage);
			} else {
				for (var key in objectArray.statuses) {
					var jsonObject = objectArray.statuses[key];
					console.log("DID IT WORK?");
					console.log(jsonObject);
				}
			}
		}
		req.send();

		console.log("DEFAULT RETURN");
		return "sasdf";
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
			rightMargin: PlasmaCore.units.smallSpacing
		}
	}
}




