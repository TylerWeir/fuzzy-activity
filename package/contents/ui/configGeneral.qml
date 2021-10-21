// configGeneral.qml
import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.0
import org.kde.kirigami 2.4 as Kirigami


Item {
	id: page
	property alias cfg_userName: userName.text
	property alias cfg_token: token.text

	property alias cfg_width: widthSpinBox.value
	property alias cfg_height: heightSpinBox.value


	Kirigami.FormLayout {
		RowLayout {
            Kirigami.FormData.label: i18n("Size:")
            SpinBox {
                id: widthSpinBox
                from: 0
                to: 2147483647 // 2^31-1
            }
            Label {
                text: " x "
            }
            SpinBox {
                id: heightSpinBox
                from: 0
                to: 2147483647 // 2^31-1
            }
        }	
		TextField {
			id: userName
			Kirigami.FormData.label: i18n("User Name:"
			placeholderText: i18n("Placeholder")
		}
		TextField {
			id: token 
			Kirigami.FormData.label: i18n("Token:")
			placeholderText: i18n("xxxxx")
		}
	}
}
