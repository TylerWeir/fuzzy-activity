// main.qml

import QtQuick 2.0
import QtQuick.Layout 1.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0

Item {

	PlasmaComponents.Label {
		text: "Hello Fuzzy Activity."

		// Always display the full view. Never show the compact icon view
		// like id toes by default when shown in the panel.
		Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation
}
