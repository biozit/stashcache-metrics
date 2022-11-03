import csv
from influxdb import InfluxDBClient
from datetime import datetime

URL="graph.t2.ucsd.edu"
user="cachemon"
db="cachemon_db"
password=""
clientflux = InfluxDBClient(URL, 8086, user, password, db)


with open('output.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    datet = datetime.utcnow().isoformat() + "Z"
    for row in csv_reader:
        if(line_count == 0):
            line_count = line_count + 1
            continue
        print(row)
        json_body = [
            {
                "measurement": "heatmaplt",
                "tags": {
                    "origin": row[0]
                },
                "time": datet,
                "fields": {
                    "read": float(row[1]),
                    "filesize": float(row[2])
                }
             },
        ]
        clientflux.write_points(json_body)
