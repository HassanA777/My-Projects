import time
import json
import random
import Adafruit_ADS1x15
import paho.mqtt.client as mqtt
import tkinter as tk

sensors = []
with open('config.json') as f:
    configs = json.load(f)

class Sensor:
    def __init__(self, config):
        #self.adc = Adafruit_ADS1x15.ADS1115()
        self.channel = config['channel']
        self.threshold = config['threshold']
        self.topic = config['topic']
        self.message = config['message']
        self.status = False
        self.value = random.randint(0, 70)
        self.sensor_type = config['sensor_type']

    def initialize(self):
        print(f"Initializing sensor {self.channel}...")
        time.sleep(2)

    def read(self):
        #self.value = self.adc.read_adc(self.channel, gain=1)
        if self.value < self.threshold:
            self.value += 1
        else:
            self.value -=1

    def check_threshold(self):
        if self.value > self.threshold:
            self.status = True
        else:
            self.status = False

    def check_and_pub(self):
        if self.status:
            client.publish(self.topic, self.message)

class App(tk.Frame):
    def __init__(self, master = None):
        super().__init__(master)
        self.master = master
        self.master.title('Sensor Dashboard')
        #self.pack()

        self.setpoint_temp = tk.StringVar(value='60')
        self.setpoint_humidity = tk.StringVar(value='60')
        self.setpoint_on = False

        self.create_widgets()
        self.update_values()

    def create_widgets(self):
        # Temperature Setpoint Label and Entry
        temp_setpoint_label = tk.Label(self.master, text='Temperature Setpoint:')
        temp_setpoint_entry = tk.Entry(self.master, textvariable=self.setpoint_temp)
        temp_setpoint_label.grid(row=0, column=0, padx=5, pady=5)
        temp_setpoint_entry.grid(row=0, column=1, padx=5, pady=5)

        # Humidity Setpoint Label and Entry
        humidity_setpoint_label = tk.Label(self.master, text='Humidity Setpoint:')
        humidity_setpoint_entry = tk.Entry(self.master, textvariable=self.setpoint_humidity)
        humidity_setpoint_label.grid(row=1, column=0, padx=5, pady=5)
        humidity_setpoint_entry.grid(row=1, column=1, padx=5, pady=5)

        # Set Setpoint Button
        def set_setpoint():
            self.setpoint_on = True

        setpoint_button = tk.Button(self.master, text='Set', command=set_setpoint)
        setpoint_button.grid(row=2, column=1, padx=5, pady=5)

        # Create Labels
        self.sensor_labels = []
        for sensor in sensors:
            label = tk.Label(self.master, text=f"Channel: {sensor.channel} | Value: {sensor.value} | Type: {sensor.sensor_type}")
            self.sensor_labels.append(label)
            label.grid(row=len(self.sensor_labels) + 2, column=0, padx=5, pady=5)

    def update_values(self):
        for sensor in sensors:
            sensor.read()
            sensor.check_threshold()
            sensor.check_and_pub()
            #client.loop()
            # Update Sensor Labels
            for label in self.sensor_labels:
                if label.cget('text').startswith(f"Channel: {sensor.channel}"):
                    label.config(text=f"Channel: {sensor.channel} | Value: {sensor.value}")

        self.master.after(2000, self.update_values)

def on_connect(client, userdata, flags, rc):
    print('Connected with result code '+str(rc))
    client.subscribe("sensors/sensor1")

def on_message(client, userdata, msg):
    print(f"Received message on topic {msg.topic}: {msg.payload.decode()}")


client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message
client.connect('localhost', 1883, 60)
client.loop_start()

for config in configs['sensors']:
    sensor = Sensor(config)
    sensors.append(sensor)
    sensor.initialize()

root = tk.Tk()
app = App(master=root)
app.mainloop()