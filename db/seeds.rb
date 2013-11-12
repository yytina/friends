Registrant.destroy_all
User.destroy_all
Meetup.destroy_all

Registrant.create([
  {
    id: SecureRandom.urlsafe_base64,
    email: "bob@munat.com",
    expires_at: Time.now + 4.hours
  },
  {
    id: SecureRandom.urlsafe_base64,
    email: "bill@munat.com",
    expires_at: Time.now + 4.hours
  },
  {
    id: SecureRandom.urlsafe_base64,
    email: "biff@munat.com",
    expires_at: Time.now + 4.hours
  }
])

users = User.create([
  {
    id: SecureRandom.urlsafe_base64,
    name: "Tina",
    email: "tina@gmail.com",
    password: "123",
    password_confirmation: "123"
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Cha",
    email: "cha@gmail.com",
    password: "123",
    password_confirmation: "123"
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Ted",
    email: "ted@gmail.com",
    password: "123",
    password_confirmation: "123"
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Xena",
    email: "xena@gmail.com",
    password: "123",
    password_confirmation: "123"
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Vera",
    email: "vera@gmail.com",
    password: "123",
    password_confirmation: "123"
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Mac",
    email: "Mac@gmail.com",
    password: "123",
    password_confirmation: "123"
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Pat",
    email: "pat@gmail.com",
    password: "123",
    password_confirmation: "123"
  }


])

Meetup.create([
  {
    id: SecureRandom.urlsafe_base64,
    primary: users[0],
    friend: users[1],
    meetup_at: Time.now+1.day,
    place: "Cyberport 3",
    is_coffee: true,
    is_beer: false
  },
  {
    id: SecureRandom.urlsafe_base64,
    primary: users[2],
    friend: users[0],
    meetup_at: Time.now+2.day,
    place: "IFC Fuel",
    is_coffee: true,
    is_beer: false
  },
  {
    id: SecureRandom.urlsafe_base64,
    primary: users[3],
    friend: users[0],
    meetup_at: Time.now+5.day+2.hour,
    place: "IFC Red",
    is_coffee: false,
    is_beer: true
  }
])

Profile.create([
  {
    id: SecureRandom.urlsafe_base64,
    name: "Tina",
    user: users[0],
    subjects: [
      {
        keyword: "music",
        weight: 3,
        thoughts: "music feels like either mine or noise.",
        questions:"When is music more effective than words?"
      },
      {
        keyword: "education",
        weight: 3,
        thoughts: "Teaching is the most effective way of learning. Teaching is fun.",
        questions: "What are the good subjects for new curriculum?"
      }
    ]
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Cha",
    user: users[1],
     subjects: [
      {
        keyword: "food",
        weight: 3,
        thoughts: "Treating food is a good way of greeting. Steak is the most satisfying food.",
        questions: "What constitues expensive restaurants?"
      },
      {
        keyword: "sports",
        weight: 3,
        thoughts: "Playing sports awakens animal instincts.",
        questions: "Does playing sports stimulate intellectual activites?"
      },
      {
        keyword: "music",
        weight: 2,
        thoughts: "Rap is more difficult genre than classical music.",
        questions: "Is music more rational or emotional?"
      }
    ]
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Ted",
    user: users[2],
     subjects: [
      {
        keyword: "fashion",
        weight: 3,
        thoughts: "Fashion is important as visual representation of self.",
        questions: "Does fashion represent more fantasy or reality?"
      },
      {
        keyword: "digital",
        weight: 3,
        thoughts: "Digital age has different paradigm from industrial age. ",
        questions: "Does emerging countries have the leadership potential in the digital age? Can digital image make up for the problem of limited resource?"
      },
      {
        keyword: "sports",
        weight: 2,
        thoughts: "Sports is important for health and fun for game.",
        questions: "What is the influence of sports on intelligent worker? How is sports different for professional and amateur? "
      },
      {
        keyword: "music",
        weight: 2,
        thoughts: "Pop music represents the spirit of the era. For example, rock represents rebellious and attitude of 70-80s. ",
        questions: "Isn't electronic music exhausted and if so what's coming in the next age?"
      }
    ]
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Xena",
    user: users[3],
     subjects: [
      {
        keyword: "fashion",
        weight: 2,
        thoughts: "Fashion goes from one extreme to another every cycle. The popularity of print reflectss bad economy.",
        questions: "?"
      },
      {
        keyword: "Digital",
        weight: 2,
        thoughts: "Digital environments provides more freedom.",
        questions: "Does the abundance of digital data increase the value of physical presence? What is irreplacable even in the digital age?"
      },
      {
        keyword: "sports",
        weight: 1,
        thoughts: "Sports imitate computer games such as in Play Station games",
        questions: "Why are most Americans into watching sports?"
      },
      {
        keyword: "music",
        weight: 1,
        thoughts: "Electronic music tires ears after short time.",
        questions: "Why is karaoke more popular in Asia?"
      },
      {
        keyword: "Painting",
        weight: 3,
        thoughts: "Violence in painting is against violence in reality as in the case of Picasso.",
        questions: "Are paintings more intimate than sculptures?"
      }
    ]
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Vera",
    user: users[4],
     subjects: [
      {
        keyword: "reading",
        weight: 3,
        thoughts: "reading helps you overcome the gap between experiencing self and remembering self.",
        questions: "When is reading more effective than listening?"
      },
      {
        keyword: "digital",
        weight: 1,
        thoughts: "Digital tools dampens thinking ability.",
        questions: "What are the measures against side effects of digital age?"
      },
      {
        keyword: "History",
        weight: 4,
        thoughts: "History shows same principles in different forms.",
        questions: "Does personal history has the same principle of history?"
      },
      {
        keyword: "languages",
        weight: 2,
        thoughts: "Mastering languages includes understanding their culture.",
        questions: "Do languages govern your thinking?"
      }
    ]
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Mac",
    user: users[5],
     subjects: [
      {
        keyword: "Humanism",
        weight: 1,
        thoughts: "Humanism is not effective when self-interest dominates. Knowing more details strengthens compassion",
        questions: "What is the blind spot of current activities of humanism?"
      },
      {
        keyword: "digital",
        weight: 3,
        thoughts: "Digital age has different paradigm from industrial age. ",
        questions: "Does emerging countries have the leadership potential in the digital age? Can digital image make up for the problem of limited resource?"
      },
      {
        keyword: "sports",
        weight: 2,
        thoughts: "Sports is important for health and fun for game.",
        questions: "What is the influence of sports on intelligent worker? How is sports different for professional and amateur? "
      },
      {
        keyword: "dramas",
        weight: 2,
        thoughts: "watching dramas help you see your realiy better.",
        questions: "Is drama more dramatic because it's simplified?"
      }
    ]
  },
  {
    id: SecureRandom.urlsafe_base64,
    name: "Pat",
    user: users[6],
     subjects: [
      {
        keyword: "digital",
        weight: 3,
        thoughts: "Digital age has different paradigm from industrial age. ",
        questions: "Does emerging countries have the leadership potential in the digital age? Can digital image make up for the problem of limited resource?"
      },
      {
        keyword: "sports",
        weight: 2,
        thoughts: "Sports is important for health and fun for game.",
        questions: "What is the influence of sports on intelligent worker? How is sports different for professional and amateur? "
      },
      {
        keyword: "music",
        weight: 1,
        thoughts: "Pop music represents the spirit of the era. For example, rock represents rebellious and attitude of 70-80s. ",
        questions: "Isn't electronic music exhausted and if so what's coming in the next age?"
      }
    ]
  }
])