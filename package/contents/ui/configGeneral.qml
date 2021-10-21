// configGeneral.qml
import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0
import org.kde.kirigami 2.4 as Kirigami

Kirigami.FormLayout {
	id: page
	property alias cfg_userName: userName.text
	property alias cfg_token: token.text

	TextField {
		id: userName
		Kirigami.FormData.label: il8n("User Name:"
		placeholderText: il8n("Placeholder")
	}
	TextField {
		id: token 
		Kirigami.FormData.label: il8n("Token:")
		placeholderText: il8n("xxxxx")
	}
}
