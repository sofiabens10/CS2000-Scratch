#level intermediate

@ dataclass
class song:
    title: str
    artist: str
    play_count: int

HELP = song("Help!", "The Beatles", 120)
RUNAWAY = song("Runaway", "Del Shannon", 45)

def popular_titles(songs: list[song], at_least: int) -> list[str]:
    """ the titles of songs in songs played at least at_least times """
    popular = list(filter(lambda s: s.play_count >= at_least, songs))
    return list(map(lambda s: s.title, popular))

def test_popular_titles():
    assert popular_titles([HELP, RUNAWAY], 100) == ["Help!"]
    assert popular_titles([HELP, RUNAWAY], 0) == ["Help!", "Runaway"]
