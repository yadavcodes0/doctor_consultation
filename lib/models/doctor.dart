class Doctor {
  final String id;
  final String name;
  final String speciality;
  final String imageUrl;
  final double rating;
  final int experience;
  final bool isAvailable;

  Doctor({
    required this.name,
    required this.imageUrl,
    required this.id,
    required this.speciality,
    required this.rating,
    required this.experience,
    this.isAvailable = true,
  });

  static List<Doctor> getDoctors() {
    return [
      Doctor(
        id: '1',
        name: 'Dr. John Doe',
        speciality: 'Cardiologist',
        imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        rating: 4.5,
        experience: 10,
        isAvailable: true,
      ),
      Doctor(
        id: '2',
        name: 'Dr. Jane Smith',
        speciality: 'Dentist',
        imageUrl: 'https://randomuser.me/api/portraits/women/2.jpg',
        rating: 4.2,
        experience: 8,
        isAvailable: false,
      ),
      Doctor(
        id: '3',
        name: 'Dr. Michael Johnson',
        speciality: 'Pediatrician',
        imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
        rating: 4.8,
        experience: 12,
        isAvailable: true,
      ),
      Doctor(
        id: '4',
        name: 'Dr. Emily Davis',
        speciality: 'Dermatologist',
        imageUrl: 'https://randomuser.me/api/portraits/women/4.jpg',
        rating: 4.3,
        experience: 9,
        isAvailable: false,
      ),

      Doctor(
        id: '5',
        name: 'Dr. William Brown',
        speciality: 'Orthopedic Surgeon',
        imageUrl: 'https://randomuser.me/api/portraits/men/5.jpg',
        rating: 4.7,
        experience: 11,
        isAvailable: true,
      ),
    ];
  }
}
