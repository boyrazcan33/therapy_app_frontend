final List<Map<String, dynamic>> mockTherapists = [
  {
    'id': 't1',
    'name': 'Dr. Sarah Johnson',
    'specialization': ['Anxiety', 'Depression', 'CBT'],
    'experience': 10,
    'rating': 4.8,
    'languages': ['English', 'Estonian'],
    'bio': 'Ph.D. in Clinical Psychology. Compassionate approach focusing on anxiety and depression.',
    'availability': ['Mon', 'Wed', 'Fri'],
    'profileImage': 'assets/images/dr_sarah_johnson.jpg',
  },
  {
    'id': 't2',
    'name': 'Dr. James Lee',
    'specialization': ['Family Therapy', 'Relationships'],
    'experience': 8,
    'rating': 4.8,
    'languages': ['English', 'Latvian'],
    'bio': 'Experienced in resolving family conflicts and improving communication.',
    'availability': ['Tue', 'Thu'],
    'profileImage': 'assets/images/dr_james_lee.jpg',
  },
  {
    'id': 't3',
    'name': 'Dr. Emily Chen',
    'specialization': ['Trauma Therapy', 'PTSD'],
    'experience': 12,
    'rating': 4.9,
    'languages': ['English', 'Russian', 'Lithuanian'],
    'bio': 'Compassionate therapist specializing in trauma recovery and resilience building.',
    'availability': ['Mon', 'Wed'],
    'profileImage': 'assets/images/dr_emily_chen.jpg',
  },
];

final List<Map<String, dynamic>> mockUsers = [
  {
    'id': 'u1001',
    'username': 'BlueCat123',
    'anonymous': true,
    'language': 'Estonian',
    'therapyGoals': ['Reduce Anxiety', 'Manage Stress'],
    'preferredTherapy': 'CBT',
  },
  {
    'id': 'u1002',
    'username': 'RedFox823',
    'anonymous': true,
    'language': 'Russian',
    'therapyGoals': ['Improve Relationships'],
  },
];

final List<String> mockMotivationQuotes = [
  "You're stronger than you think.",
  "Healing takes time, and asking for help is courageous.",
  "Your mental health matters. Take it one day at a time.",
  "The first step is the hardest, but it's worth it.",
];

final Map<String, List<String>> mockAvailability = {
  'Dr. Sarah Johnson': [
    '2025-03-12 10:00',
    '2025-03-12 13:00',
    '2025-03-14 15:00',
  ],
  'Dr. James Lee': [
    '2025-03-15 10:00',
    '2025-03-15 16:00',
  ],
  'Dr. Emily Chen': [
    '2025-03-16 09:00',
    '2025-03-17 11:00',
  ],
};

final List<Map<String, dynamic>> mockReviews = [
  {
    'username': 'OrangeLion992',
    'rating': 5,
    'review': 'Dr. Sarah helped me overcome anxiety quickly.',
  },
  {
    'username': 'BlueDolphin673',
    'rating': 4.5,
    'review': 'Amazing experience, very professional and helpful.',
  },
  {
    'username': 'GreenTiger378',
    'rating': 4.8,
    'review': 'Excellent therapist, supportive and understanding.',
  },
];
final List<Map<String, dynamic>> mockPayments = [
  {
    'id': 'p1',
    'userId': 'u1001',
    'amount': 100.0,
    'currency': 'USD',
    'status': 'Completed',
    'transactionDate': '2025-03-12T14:30:00Z',
    'paymentMethod': 'Credit Card',
  },
  {
    'id': 'p2',
    'userId': 'u1002',
    'amount': 50.0,
    'currency': 'EUR',
    'status': 'Pending',
    'transactionDate': '2025-03-15T09:15:00Z',
    'paymentMethod': 'PayPal',
  },
];
final List<Map<String, dynamic>> mockAppointments = [
  {
    'id': 'a1',
    'userId': 'u1001',
    'therapistId': 't1',
    'dateTime': '2025-03-14T10:00:00Z', // ISO 8601 Format
    'status': 'Confirmed',
  },
  {
    'id': 'a2',
    'userId': 'u1002',
    'therapistId': 't3',
    'dateTime': '2025-03-15T14:00:00Z',
    'status': 'Pending',
  },
];

final List<Map<String, dynamic>> mockPaymentPlans = [
  {
    'id': 'basic_monthly',
    'name': 'Single Session',
    'price': 35.0,
    'description': 'One 45-minute session, €35 per session.',
  },
  {
    'id': 'monthly_subscription',
    'name': 'Monthly Subscription',
    'price': 100.0,
    'description': 'Unlimited sessions per month (€22 per session equivalent)',
  },
  {
    'id': 'monthly_intensive',
    'name': 'Monthly Intensive Boost',
    'price': 159.0,
    'sessions_per_week': 2,
    'description': 'Twice-weekly sessions for intensive support (€20/session)',
  },
];

final List<Map<String, dynamic>> mockQuestionnaire = [
  {
    'question': 'What are your therapy goals?',
    'options': ['Reduce Anxiety', 'Manage Stress', 'Improve Relationships'],
  },
  {
    'question': 'How would you describe your personality?',
    'options': ['Introverted', 'Extroverted', 'Ambivert'],
  },
  {
    'question': 'Preferred therapy method?',
    'options': [
      'Cognitive Behavioral Therapy (CBT)',
      'Psychodynamic Therapy',
      'Humanistic Therapy',
    ],
  },
];
