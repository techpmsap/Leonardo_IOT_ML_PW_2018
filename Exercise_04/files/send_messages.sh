set -B # enable brace expansion
for i in {1..20}; do
	temperature=$(($RANDOM%40))
	humidity=$(($RANDOM%99))
	light=$(($RANDOM%87))
	echo "temperature=" $temperature
	echo "humidity=" $humidity
	echo "light=" $light
	echo "------"
	curl -v -k --cert-type PEM --cert pw_sensor_node_xx-device_certificate.pem:o6S9dYv9BVQsCsU6 -H "Content-Type: application/json" -d "{ \"capabilityAlternateId\":  \"f13de4527155ee15\", \"sensorAlternateId\": \"3a53c3a4ac1d4130\",\"measures\":[[$temperature,$humidity,$light]]}" https://weather-station.eu10.cp.iot.sap/iot/gateway/rest/measures/dc589032389d4044
	sleep 5 #sleeps for every 5 seconds
done