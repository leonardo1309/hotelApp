import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/postingObjects.dart';
import 'package:hotel_app/Views/textWidgets.dart';

import 'hostHomePage.dart';

class CreatePostingPage extends StatefulWidget {
  static final String routeName = '/CreatePostingPageRoute';

  final Posting posting;

  CreatePostingPage({this.posting, Key key}) : super(key: key);

  @override
  _CreatePostingPageState createState() => _CreatePostingPageState();
}

class _CreatePostingPageState extends State<CreatePostingPage> {

  final List<String> _houseTypes = [
    'Apartamento',
    'Casa',
    'Finca',
    'Casa de campo',
  ];

  TextEditingController _nameController;
  TextEditingController _priceController;
  TextEditingController _descriptionController;
  TextEditingController _addressController;
  TextEditingController _countryController;
  TextEditingController _cityController;
  TextEditingController _amenitiesController;

  String _houseType;
  Map<String, int> _beds;
  Map<String, int> _bathrooms;
  List<MemoryImage> _images;

  void _setUpInitailValues() {
    if(widget.posting == null) {
      _nameController = TextEditingController();
      _priceController = TextEditingController();
      _descriptionController = TextEditingController();
      _addressController = TextEditingController();
      _cityController = TextEditingController();
      _countryController = TextEditingController();
      _amenitiesController = TextEditingController();
      _beds = {
        'small' : 0,
        'medium' : 0,
        'large' : 0,
      };
      _bathrooms = {
        'full' : 0,
        'half' : 0,
      };
      _images = [];
    } else {
      _nameController = TextEditingController(text: widget.posting.name);
      _priceController = TextEditingController(text: widget.posting.price.toString());
      _descriptionController = TextEditingController(text: widget.posting.description);
      _addressController = TextEditingController(text: widget.posting.address);
      _cityController = TextEditingController(text: widget.posting.city);
      _countryController = TextEditingController(text: widget.posting.country);
      _amenitiesController = TextEditingController(text: widget.posting.getAmenitiesString());
      _beds = widget.posting.beds;
      _bathrooms = widget.posting.bathrooms;
      _images = widget.posting.displayImages;
    }
    setState(() {});
  }


  @override
  void initState() {
    _setUpInitailValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: 'Create a posting'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 50, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Please enter the following information:',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Posting name'),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _nameController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: DropdownButton(
                          isExpanded: true,
                          value: _houseType,
                          hint: Text(
                            'Select a House type',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          items: _houseTypes.map((type) {
                            return DropdownMenuItem(
                              value: type,
                              child: Text(
                                type,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(labelText: 'Price'),
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                                keyboardType: TextInputType.number,
                                controller: _priceController,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 15),
                              child: Text(
                                '\$ / noche',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Description'),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _descriptionController,
                          maxLines: 3,
                          minLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Address'),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _addressController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'City'),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _cityController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Country'),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _countryController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Text(
                          'Beds',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                        child: Column(
                          children: <Widget>[
                            FacilitiesWidget(
                              type: 'Twin/Single',
                              startValue: _beds['small'],
                            ),
                            FacilitiesWidget(
                              type: 'Double',
                              startValue: _beds['medium'],
                            ),
                            FacilitiesWidget(
                              type: 'King/Queen',
                              startValue: _beds['large'],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Text(
                          'Bathrooms',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 25, 15, 0),
                        child: Column(
                          children: <Widget>[
                            FacilitiesWidget(
                              type: 'Half',
                              startValue: _bathrooms['half'],
                            ),
                            FacilitiesWidget(
                              type: 'Full',
                              startValue: _bathrooms['full'],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Amenities (comma separated)'),
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                          controller: _amenitiesController,
                          maxLines: 3,
                          minLines: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35.0),
                        child: Text(
                          'Images',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: _images.length + 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 25,
                            crossAxisSpacing: 25,
                            childAspectRatio: 3 / 2,
                          ),
                          itemBuilder: (context, index) {
                            if (index == _images.length) {
                              return IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {},
                              );
                            }
                            return MaterialButton(
                              onPressed: () {},
                              child: Image(
                                image: _images[index],
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FacilitiesWidget extends StatefulWidget {
  final String type;
  final int startValue;

  FacilitiesWidget({Key key, this.type, this.startValue}) : super(key: key);

  @override
  _FacilitiesWidgetState createState() => _FacilitiesWidgetState();
}

class _FacilitiesWidgetState extends State<FacilitiesWidget> {
  int _value;

  @override
  void initState() {
    this._value = widget.startValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          widget.type,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {},
            ),
            Text(
              this._value.toString(),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }
}
