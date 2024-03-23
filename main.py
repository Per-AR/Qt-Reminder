from PyQt5.QtCore import QObject, pyqtSlot, QTimer
from PyQt5.QtGui import QGuiApplication, QIcon
from PyQt5.QtWidgets import QSystemTrayIcon
from PyQt5.QtQml import QQmlApplicationEngine

class Backend(QObject):
    def __init__(self):
        super().__init__()
        self.tray_icon = QSystemTrayIcon(QIcon("icon.png"), parent=None)
        self.timer_eye = QTimer(self)
        self.timer_move = QTimer(self)
        self.timer_water = QTimer(self)

    @pyqtSlot(int)
    def setEyeInterval(self, interval):
        self.timer_eye.setInterval(interval * 60000)  # Convert minutes to milliseconds
        self.timer_eye.timeout.connect(self.showEyeNotification)
        self.timer_eye.start()

    @pyqtSlot(int)
    def setMoveInterval(self, interval):
        self.timer_move.setInterval(interval * 60000)  # Convert minutes to milliseconds
        self.timer_move.timeout.connect(self.showMoveNotification)
        self.timer_move.start()

    @pyqtSlot(int)
    def setWaterInterval(self, interval):
        self.timer_water.setInterval(interval * 60000)  # Convert minutes to milliseconds
        self.timer_water.timeout.connect(self.showWaterNotification)
        self.timer_water.start()

    def showEyeNotification(self):
        self.tray_icon.showMessage("Eye Exercise Reminder", "Take a break and do eye exercises!", QSystemTrayIcon.Information, 5000)

    def showMoveNotification(self):
        self.tray_icon.showMessage("Move Around Reminder", "It's time to stand up and move around!", QSystemTrayIcon.Information, 5000)

    def showWaterNotification(self):
        self.tray_icon.showMessage("Drink Water Reminder", "Stay hydrated! Drink a glass of water.", QSystemTrayIcon.Information, 5000)

if __name__ == "__main__":
    import sys

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    backend = Backend()
    engine.rootContext().setContextProperty("backend", backend)

    engine.load("main.qml")

    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
