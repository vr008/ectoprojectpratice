alias MusicDB.{Repo}
alias MusicDB.{Artist, Album, Track, Genre, AlbumWithEmbeds, ArtistEmbed, TrackEmbed, SoldUnits, Rating,ArtistFeedback,TrackFeedback}

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
          index: 1
        },
        %Track{
          title: "Resolution",
          duration: 482,
          index: 2
        },
        %Track{
          title: "Pursuance",
          duration: 593,
          index: 3
        },
        %Track{
          title: "Psalm",
          duration: 426,
          index: 4
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
          index: 1
        },
        %Track{
          title: "Cousin Mary",
          duration: 332,
          index: 2
        },
        %Track{
          title: "Countdown",
          duration: 150,
          index: 3
        },
        %Track{
          title: "Spiral",
          duration: 340,
          index: 4
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 600
      }]
    }
  ],
  ratings: [%Rating{
    rating: 9
  }]
  artist
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
          index: 1
        },
        %Track{
          title: "The Eye of the Hurricane",
          duration: 345,
          index: 2
        },
        %Track{
          title: "Little One",
          duration: 492,
          index: 3
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
          index: 1
        },
        %Track{
          title: "Watermelon Man",
          duration: 395,
          index: 2
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 750
      }]
    }
  ],
  ratings: [%Rating{
    rating: 8
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
          index: 1
        },
        %Track{
          title: "What Game Shall We Play Today?",
          duration: 342,
          index: 2
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 400
      }]
    }
  ],
  ratings: [%Rating{
    rating: 7
  }]
}

IO.puts ""
IO.puts "Success! Sample data has been added."
