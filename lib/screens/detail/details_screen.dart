import 'package:cityguidemob/models/place.dart';
import 'package:cityguidemob/services/api_service.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String placeId;

  const DetailsScreen({Key? key, required this.placeId}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late ApiService _apiService;
  Place? _placeDetails;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
    _fetchPlaceDetails();
  }

  Future<void> _fetchPlaceDetails() async {
    try {
      final placeDetails = await _apiService.fetchPlaceDetails(widget.placeId);
      setState(() {
        _placeDetails = placeDetails;
        _isLoading = false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching place details: $e')),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_placeDetails?.name ?? 'Place Details'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _placeDetails == null
              ? const Center(child: Text('Place details not found'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Place name
                        Text(
                          _placeDetails!.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),

                        // Address
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                _placeDetails!.address,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Rating
                        if (_placeDetails!.rating > 0)
                          Row(
                            children: [
                              const Icon(Icons.star, color: Colors.amber),
                              const SizedBox(width: 8),
                              Text(
                                '${_placeDetails!.rating}/5',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),

                        // Description
                        Text(
                          _placeDetails!.description.isNotEmpty
                              ? _placeDetails!.description
                              : 'No description available.',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
