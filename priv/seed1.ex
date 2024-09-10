alias MusicDB.{Repo}
alias MusicDB.{Artist, Album, Track, Genre, AlbumWithEmbeds, ArtistEmbed, TrackEmbed,SoldUnits,Rating}

jazz_genre = Repo.insert!(%Genre{ name: "jazz", wiki_tag: "Jazz" })
live_genre = Repo.insert!(%Genre{ name: "live", wiki_tag: "Concert" })

Repo.insert! %Artist{
  name: "Eminem",
  albums: [
    %Album{
      title: "Kng of Rap",
      genres: [jazz_genre],
      tracks: [
        %Track{
          title: "Mocking bird",
          duration: 500,
          index: 11
        },
        %Track{
          title: "Without me",
          duration: 574,
          index: 12
        },
        %Track{
          title: "Slim Shady",
          duration: 320,
          index: 13
        },
        %Track{
          title: "Flamenco Sketches",
          duration: 481,
          index: 15
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 100
      }]


    },
    %Album{
      title: "King of pop",
      genres: [jazz_genre, live_genre],
      tracks: [
        %Track{
          title: "If I Were A Bell",
          duration: 142,
          index: 21
        },
        %Track{
          title: "Stella By Starlight",
          duration: 147,
          index: 22
        },
        %Track{
          title: "Walkin'",
          duration: 806,
          index: 23
        },
        %Track{
          title: "Miles",
          duration: 754,
          index: 24
        }
      ],
      sold_unit: [%SoldUnits{
      sold_units: 50
      }
    ]
    }
  ],
  ratings: [ %Rating{
    rating: 100

  }]


}

Repo.insert! %Artist{
  name: "Sia",
  albums: [
    %Album{
      title: "King of Pop",
      genres: [jazz_genre],
      tracks: [
        %Track{
          title: "Cheap Thrills",
          duration: 102,
          index: 111
        },
        %Track{
          title: "Unstoppable",
          duration: 330,
          index: 112
        },

        %Track{
          title: "This is good",
          duration: 240,
          index: 115
        },
        %Track{
          title: "The Peacocks",
          duration: 360,
          index: 115
        },
        %Track{
          title: "Sometime Ago",
          duration: 292,
          index: 116
        },
        %Track{
          title: "Theme From M*A*S*H (Suicide Is Painless)",
          duration: 353,
          index: 7
        },
        %Track{
          title: "Without a Song",
          duration: 485,
          index: 8
        },
        %Track{
          title: "Freddie Freeloader",
          duration: 454,
          index: 9
        },
        %Track{
          title: "All of You",
          duration: 489,
          index: 10
        }
      ]

    },
    %Album{
      title: "Portrait In Jazz",
      genres: [jazz_genre],
      tracks: [
        %Track{
          title: "Come Rain Or Come Shine",
          duration: 204,
          index: 1
        },
        %Track{
          title: "Autumn Leaves",
          duration: 360,
          index: 2
        },
        %Track{
          title: "Witchcraft",
          duration: 277,
          index: 3
        },
        %Track{
          title: "When I Fall In Love",
          duration: 297,
          index: 4
        },
        %Track{
          title: "Peri's Scope",
          duration: 195,
          index: 5
        },
        %Track{
          title: "What Is This Thing Called Love?",
          duration: 276,
          index: 6
        },
        %Track{
          title: "Spring Is Here",
          duration: 309,
          index: 7
        },
        %Track{
          title: "Someday My Prince Will Come",
          duration: 297,
          index: 8
        },
        %Track{
          title: "Blue In Green",
          duration: 325,
          index: 9
        }
      ],
      sold_unit: [ %SoldUnits{
        sold_units: 50
      }]
    }
  ],
  ratings: [%Rating{
    rating: 7

  }]

}

Repo.insert! %Artist{
  name: "Bobby Hutcherson",
  albums: [
    %Album{
      title: "Live At Montreaux",
      genres: [jazz_genre, live_genre],
      tracks: [
        %Track{
          title: "Anton's Ball",
          duration: 761,
          index: 1
        },
        %Track{
          title: "The Moontrane",
          duration: 647,
          index: 2
        },
        %Track{
          title: "Farallone",
          duration: 805,
          index: 3
        },
        %Track{
          title: "Song Of Songs",
          duration: 844,
          index: 4
        }
      ],
      sold_unit: [%SoldUnits{
        sold_units: 100
      }]
    }
  ],
  ratings: [ %Rating{
    rating: 5

  }]


}




IO.puts ""
IO.puts "Success! Sample data has been added."
