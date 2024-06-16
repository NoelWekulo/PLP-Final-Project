class AppUser {
  final String uid;
  final String email;
  final String displayName;
  final String address;
  final String? location;
  final String? profilePictureUrl;

  AppUser({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.address,
    this.location,
    this.profilePictureUrl,
  });

  factory AppUser.fromFirestore(Map<String, dynamic> data) {
    return AppUser(
      uid: data['uid'],
      email: data['email'],
      displayName: data['displayName'],
      address: data['address'],
      location: data['location'],
      profilePictureUrl: data['profilePictureUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'address': address,
      'location': location,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  AppUser copyWith({
    String? uid,
    String? email,
    String? displayName,
    String? address,
    String? location,
    String? profilePictureUrl,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      displayName: displayName ?? this.displayName,
      address: address ?? this.address,
      location: location ?? this.location,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }
}




