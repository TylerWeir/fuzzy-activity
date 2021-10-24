// main.qml
import QtQuick 2.0
import QtQuick.Layouts 1.0
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.plasmoid 2.0


Item {

	width: PlasmaCore.Units.gridUnit * 10
	height: PlasmaCore.Units.gridUnit * 4

	Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

	Plasmoid.toolTipMainText: "Main Tool Tip"
	Plasmoid.toolTipSubText: "Here is a helpful tool tip."

	Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

	Plasmoid.compactRepresentation: FuzzyActivity { }

}

