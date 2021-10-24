// main.qml
import QtQuick 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.extras 2.0 as PlasmaExtras

Item {
	id: root	

	width: PlasmaCore.Units.gridUnit * 10
	height: PlasmaCore.Units.gridUnit * 4

	Plasmoid.preferredRepresentation: Plasmoid.compactRepresentation

	Plasmoid.toolTipMainText: "Main Tool Tip"
	Plasmoid.toolTipSubText: "Here is a helpful tool tip."

	Plasmoid.backgroundHints: PlasmaCore.Types.ShadowBackground | PlasmaCore.Types.ConfigurableBackground

	Plasmoid.compactRepresentation: FuzzyActivity { }

}

