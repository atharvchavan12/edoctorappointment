<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoCall.aspx.cs" Inherits="WebApplication1.Doctor.VideoCall" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Video Call</title>
</head>
<body>
    <form id="form1" runat="server">
        <div id="local_stream" style="width: 400px; height: 300px; border: 1px solid #ccc;"></div>
        <div id="remote_stream" style="width: 400px; height: 300px; border: 1px solid #ccc;"></div>
        <script src="https://cdn.agora.io/sdk/release/AgoraRTC_N.js"></script>
    </form>
    <script>
        // Agora App ID and Token
        const appID = '16883b183d694f828ac624874f5ca271'; // Replace with your Agora App ID
        const token ='007eJxTYNj5PDSh+J6Q5Z2Uz5veT5F7Lqx22Xjec+cPN15t7vnlevakAoOhmYWFcZKhhXGKmaVJmoWRRWKymZGJhblJmmlyopG5Yee1wPSGQEaGyWrtzIwMEAji8zGk5RflJpaUpKbEJ8dnpjAwAACyriZD'; // Replace with your token
        const channelName = '<%= Request.QueryString["c_id"] %>' || 'default_channel';

        // Create Agora client instance
        const client = AgoraRTC.createClient({ mode: "rtc", codec: "vp8" });

        // Join the channel
        async function startCall() {
            try {
                console.log("Initializing the Agora client...");
                await client.join(appID, channelName, token);
                console.log("User joined channel successfully");

                // Create and publish the local stream
                const localStream = AgoraRTC.createMicrophoneAndCameraTracks();
                const [audioTrack, videoTrack] = await localStream;

                // Play local stream
                videoTrack.play("local_stream");

                // Publish local stream
                await client.publish([audioTrack, videoTrack]);
                console.log("Local stream published");

                // Handle remote users
                client.on("user-published", async (user, mediaType) => {
                    await client.subscribe(user, mediaType);
                    console.log("Subscribed to remote user", user.uid);

                    if (mediaType === "video") {
                        const remoteVideoTrack = user.videoTrack;
                        remoteVideoTrack.play("remote_stream");
                    }
                    if (mediaType === "audio") {
                        const remoteAudioTrack = user.audioTrack;
                        remoteAudioTrack.play();
                    }
                });

                client.on("user-unpublished", (user) => {
                    console.log("Remote user unpublished", user.uid);
                });
            } catch (error) {
                console.error("Error during call initialization:", error);
            }
        }

        // Start the video call
        startCall();
    </script>
</body>
</html>
