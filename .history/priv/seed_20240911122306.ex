alias MusicDB.{Repo}
alias MusicDB.{Artist, Album, Track, Genre, AlbumWithEmbeds, ArtistEmbed, TrackEmbed, SoldUnits, Rating, ArtistFeedback, TrackFeedback}

blues_genre = Repo.insert!(%Genre{ name: "blues", wiki_tag: "Blues" })
fusion_genre = Repo.insert!(%Genre{ name: "fusion", wiki_tag: "JazzFusion" })

Repo.insert! %Artist{
  name: "John Coltrane",
  albums: [
    %Album{
      title: "A Love Supreme",
      genres: [blues_genre],
      tracks: [
        %Track{
          title: "Acknowledgement",
          duration: 467,
          index: 1,
          track_feedback: [%TrackFeedback{
            type: "excellent",
            detailedfeedback: "Powerful opening track with deep spiritual energy."
          }]
        },
        %Track{
          title: "Resolution",
          duration: 482,
          index: 2,
          track_feedback: [%TrackFeedback{
            type: "good",
            detailedfeedback: "Solid middle section, deep harmonic exploration."
          }]
        },
        %Track{
          title: "Pursuance",
          duration: 593,
          index: 3,
          track_feedback: [%TrackFeedback{
            type: "excellent",
            detailedfeedback: "High tempo and intense solos, a masterclass in improvisation."
          }]
        },
        %Track{
          title: "Psalm",
          duration: 426,
          index: 4,
          track_feedback: [%TrackFeedback{
            type: "great",
            detailedfeedback: "A peaceful conclusion, deeply emotional and reflective."
          }]
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 500
      }]
    },
    %Album{
      title: "Giant Steps",
      genres: [blues_genre, fusion_genre],
      tracks: [
        %Track{
          title: "Giant Steps",
          duration: 290,
          index: 1,
          track_feedback: [%TrackFeedback{
            type: "excellent",
            detailedfeedback: "Track was short and crisp, iconic chord changes."
          }]
        },
        %Track{
          title: "Cousin Mary",
          duration: 332,
          index: 2,
          track_feedback: [%TrackFeedback{
            type: "good",
            detailedfeedback: "Bluesy feel with a memorable melody."
          }]
        },
        %Track{
          title: "Countdown",
          duration: 150,
          index: 3,
          track_feedback: [%TrackFeedback{
            type: "good",
            detailedfeedback: "Fast and complex, showcases technical mastery."
          }]
        },
        %Track{
          title: "Spiral",
          duration: 340,
          index: 4,
          track_feedback: [%TrackFeedback{
            type: "great",
            detailedfeedback: "A slower tune that unfolds gracefully."
          }]
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 600
      }]
    }
  ],
  ratings: [%Rating{
    rating: 9
  }],
  artist_feedback: [%ArtistFeedback{
    type: "great",
    detailedfeedback: "John Coltrane's voice on the saxophone is unmatched, blending intensity with emotion."
  }]
}

Repo.insert! %Artist{
  name: "Herbie Hancock",
  albums: [
    %Album{
      title: "Maiden Voyage",
      genres: [fusion_genre],
      tracks: [
        %Track{
          title: "Maiden Voyage",
          duration: 446,
          index: 1,
          track_feedback: [%TrackFeedback{
            type: "excellent",
            detailedfeedback: "Dreamy and exploratory, a hallmark of Hancock's genius."
          }]
        },
        %Track{
          title: "The Eye of the Hurricane",
          duration: 345,
          index: 2,
          track_feedback: [%TrackFeedback{
            type: "good",
            detailedfeedback: "Fast and furious, but well controlled."
          }]
        },
        %Track{
          title: "Little One",
          duration: 492,
          index: 3,
          track_feedback: [%TrackFeedback{
            type: "great",
            detailedfeedback: "A tender ballad with complex harmonies."
          }]
        }
      ]
    },
    %Album{
      title: "Head Hunters",
      genres: [fusion_genre],
      tracks: [
        %Track{
          title: "Chameleon",
          duration: 907,
          index: 1,
          track_feedback: [%TrackFeedback{
            type: "excellent",
            detailedfeedback: "Funky and infectious, a groundbreaking jazz-fusion track."
          }]
        },
        %Track{
          title: "Watermelon Man",
          duration: 395,
          index: 2,
          track_feedback: [%TrackFeedback{
            type: "good",
            detailedfeedback: "Groovy with catchy rhythms, blends jazz with African influence."
          }]
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 750
      }]
    }
  ],
  ratings: [%Rating{
    rating: 8
  }],
  artist_feedback: [%ArtistFeedback{
    type: "excellent",
    detailedfeedback: "Herbie Hancock’s fusion of jazz and funk is revolutionary."
  }]
}

Repo.insert! %Artist{
  name: "Chick Corea",
  albums: [
    %Album{
      title: "Return to Forever",
      genres: [fusion_genre],
      tracks: [
        %Track{
          title: "Crystal Silence",
          duration: 575,
          index: 1,
          track_feedback: [%TrackFeedback{
            type: "excellent",
            detailedfeedback: "Beautifully minimalist and ethereal, a timeless classic."
          }]
        },
        %Track{
          title: "What Game Shall We Play Today?",
          duration: 342,
          index: 2,
          track_feedback: [%TrackFeedback{
            type: "good",
            detailedfeedback: "Fun and lighthearted, showcases Corea's playful side."
          }]
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 400
      }]
    }
  ],
  ratings: [%Rating{
    rating: 7
  }],
  artist_feedback: [%ArtistFeedback{
    type: "great",
    detailedfeedback: "Chick Corea’s innovation in jazz fusion continues to inspire musicians worldwide."
  }]
}

IO.puts ""
IO.puts "Success! Sample data has been added."
