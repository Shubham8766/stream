import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stream/models/channel_model.dart';
import 'package:stream/services/api_services.dart';
import 'userId.dart';
import 'package:stream/models/video_model.dart';
import 'package:stream/HomePage/video_player.dart';


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int pageIndex = 0;
  final pages = [
    const Page1(),
    const Page2(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              "Vstream       ",
              style: GoogleFonts.bebasNeue(
                color: Colors.white70,
                textStyle: const TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Home page Icon
            IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                icon: pageIndex == 0
                    ? Icon(
                        Icons.home_filled,
                        color: Colors.white,
                        size: 35,
                      )
                    : Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                        size: 35,
                      )),

            // User Profile Icon
            IconButton(
                enableFeedback: false,
                onPressed: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                icon: pageIndex == 1
                    ? Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 35,
                      )
                    : Icon(
                        Icons.person_outline,
                        color: Colors.white,
                        size: 35,
                      )),
          ],
        ),
      ),
    );
  }
}








// Home page code

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {

  late Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC9ChdqQRCaZmTCwSJ49tcbw');
    setState(() {
      _channel = channel;
    });
  }

  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      height: 100.0,
      decoration: BoxDecoration(
         gradient: LinearGradient(colors: [Colors.grey, Colors.blueGrey]),

        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.profilePictureUrl),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                 _channel.title,
                  style: GoogleFonts.bebasNeue(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60),
                ),
                Text(
                  '${_channel.subscriberCount} subscribers',
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric( vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white54,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Image(
              width: 150.0,
              image: NetworkImage(video.thumbnailUrl),
            ),
            SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black54, Colors.black12])
        ),
        child: _channel != null
            ? NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollDetails) {
            if (!_isLoading &&
                _channel.videos.length != int.parse(_channel.videoCount) &&
                scrollDetails.metrics.pixels ==
                    scrollDetails.metrics.maxScrollExtent) {
              _loadMoreVideos();
            }
            return false;
          },
          child: ListView.builder(
            itemCount: 1 + _channel.videos.length,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return _buildProfileInfo();
              }
              Video video = _channel.videos[index - 1];
              return _buildVideo(video);
            },
          ),
        )
            : Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).primaryColor, // Red
            ),
          ),
        ),
      ),
    );
  }
}









// User Profile code

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.black54, Colors.black12])),
      child: Account(),
    );
  }
}
