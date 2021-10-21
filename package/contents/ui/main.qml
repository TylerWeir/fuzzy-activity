// main.qml
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0


Item {
	// Always display the full veiw
	Plasmoid.preferredRepresentation: Plasmoid.fullRepresentation

	Plasmoid.fullRepresentation: Item {
		Layout.minimumWidth: label.implicitWidth
		Layout.minimumHeight: label.implicitHeight
		Layout.preferredWidth: plasmoid.configuration.width * PlasmaCore.Units.devicePixelRatio
		Layout.preferredHeight: plasmoid.configuration.height * PlasmaCore.Units.devicePixelRatio

		PlasmaComponents.Label {
			id: label
			anchors.fill: parent
			text: "Fuzzy Activity"
			horizontalAlignment: Text.AlignHCenter
		}
	}
}
