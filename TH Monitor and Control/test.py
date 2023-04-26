import tkinter as tk
import random

class App(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()
        self.update_values() # call update_values() to start updating sensor values periodically

    def create_widgets(self):
        self.sensor1_label = tk.Label(self, text="Sensor 1: ")
        self.sensor1_label.pack()
        self.sensor2_label = tk.Label(self, text="Sensor 2: ")
        self.sensor2_label.pack()
        self.sensor3_label = tk.Label(self, text="Sensor 3: ")
        self.sensor3_label.pack()

    def update_values(self):
        # Replace with your code to read sensor values
        sensor1_value = random.uniform(0, 1)
        sensor2_value = random.uniform(0, 1)
        sensor3_value = random.uniform(0, 1)

        # Update the labels with new sensor values
        self.sensor1_label.configure(text=f"Sensor 1: {sensor1_value:.2f}")
        self.sensor2_label.configure(text=f"Sensor 2: {11:.2f}")
        self.sensor3_label.configure(text=f"Sensor 3: {5:.2f}")

        # Schedule the next update in 2000 milliseconds (2 seconds)
        self.after(2000, self.update_values)

root = tk.Tk()
app = App(master=root)
app.mainloop()