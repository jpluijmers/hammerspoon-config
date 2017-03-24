

#DEFINE int TrajectSize = 100;
#DEFINE int minDistance = 5;
#DEFINE int intervalInMS = 100;

bool running = false;
int duration = false;
long distance;

void loop(){

	distance = measureDistance();

	// Start traject
	if ( !running && distance > minDistance && distance < ( minDistance + TrajectSize) ){
		// start traject
		running = true;

		// Reset duration
		duration = 0;
	}
	// Onderweg in traject
	else if ( running && distance > minDistance && distance < ( minDistance + TrajectSize) ){
		// Add current sample rate to the duration of the traject 
		duration = duration + intervalInMS; 
	}

	// End of traject because:
	// 1. Distance = lower than minDistance
	// 2. Distance = greather than minDistance + TrajectSize;
	else if ( running && ( distance < minDistance || distance > ( minDistance + TrajectSize)  ) ){
		averageSpeed = distance / ( duration / 1000 )
	}

	delay(intervalInMS);
}

long measureDistance (){
   
}