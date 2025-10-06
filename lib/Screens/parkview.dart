import 'package:flutter/material.dart';
import 'package:parking_system/model/vehcile.dart';

class ParkviewScreen extends StatefulWidget {
  const ParkviewScreen({super.key});

  @override
  State<ParkviewScreen> createState() => _ParkviewScreenState();
}

class _ParkviewScreenState extends State<ParkviewScreen> {
  int total_earning = 0;
  String? raioButtonValue;
  TextEditingController reg_no = TextEditingController();
  TextEditingController searchController=TextEditingController();

  List<VechicleModel> parkedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Parking System',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
        
          children: [
            Container(
              width: 200,
              height: 33,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 3,
                ),
               
              ),
              child: Center(
                child: Text(
                  'Total Earning: RS $total_earning',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 10,
              child: Container(
                width: 400,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),

                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: reg_no,
                        decoration: InputDecoration(
                          label: Text('Registration Number'),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          activeColor: Colors.green,
                          value: 'Car',
                          groupValue: raioButtonValue,
                          onChanged: (String? val) {
                            raioButtonValue = val;
                            setState(() {});
                          },
                        ),
                        Text('Car'),
                        SizedBox(width: 5),
                        Radio(
                          activeColor: Colors.green,
                          value: 'Bike',
                          groupValue: raioButtonValue,
                          onChanged: (String? val) {
                            raioButtonValue = val;
                            setState(() {});
                          },
                        ),
                        Text('Bike'),
                      ],
                    ),
                    SizedBox(height: 2),
                    ElevatedButton(
                      onPressed: () {
                          Icon radioicon;
                        var text=reg_no.text.toString();
                         if(raioButtonValue=='Bike'){
                          radioicon=Icon(Icons.pedal_bike);
                        }else{
                          radioicon=Icon(Icons.car_crash);
                        }
                      VechicleModel  obj=VechicleModel(title:text , iconbtn: radioicon);
                       

parkedList.add(obj);
setState(() {
  
});

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text(
                        'Park in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search By Registration Number',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 8),
            parkedList.length == 0
                ? Expanded(
                    child: Center(
                      child: Text(
                        'No Vehicle Parked',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                : Expanded(
                  child: ListView.builder(
                      itemCount: parkedList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: ListTile(
                          leading: parkedList[index].iconbtn,
                            title: Text(parkedList[index].title),
                            trailing: ElevatedButton(onPressed: (){
                            if(parkedList[index].iconbtn==Icon(Icons.car_crash)){
                              total_earning+=100;
                            }else{
                              total_earning+=50;
                            }
                            parkedList.removeAt(index);
setState(() {
  
});
                            }, child: Text('Park')),
                                            
                          ),
                        );
                        
                      },
                    ),
                ),
          ],
        ),
      ),
    );
  }
}
