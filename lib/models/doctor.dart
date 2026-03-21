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
        imageUrl:
            'https://ui-avatars.com/api/?name=John+Doe&size=200&background=FF689D&color=fff&rounded=true&bold=true',
        rating: 4.5,
        experience: 10,
        isAvailable: true,
      ),
      Doctor(
        id: '2',
        name: 'Dr. Jane Smith',
        speciality: 'Dentist',
        imageUrl:
            'https://ui-avatars.com/api/?name=Jane+Smith&size=200&background=667EEA&color=fff&rounded=true&bold=true',
        rating: 4.2,
        experience: 8,
        isAvailable: false,
      ),
      Doctor(
        id: '3',
        name: 'Dr. Michael Johnson',
        speciality: 'Pediatrician',
        imageUrl:
            'https://ui-avatars.com/api/?name=Michael+Johnson&size=200&background=00BFA5&color=fff&rounded=true&bold=true',
        rating: 4.8,
        experience: 12,
        isAvailable: true,
      ),
      Doctor(
        id: '4',
        name: 'Dr. Emily Davis',
        speciality: 'Dermatologist',
        imageUrl:
            'https://ui-avatars.com/api/?name=Emily+Davis&size=200&background=FFA726&color=fff&rounded=true&bold=true',
        rating: 4.3,
        experience: 9,
        isAvailable: false,
      ),
      Doctor(
        id: '5',
        name: 'Dr. William Brown',
        speciality: 'Orthopedic Surgeon',
        imageUrl:
            'https://ui-avatars.com/api/?name=William+Brown&size=200&background=7C3AED&color=fff&rounded=true&bold=true',
        rating: 4.7,
        experience: 11,
        isAvailable: true,
      ),
    ];
  }
}
