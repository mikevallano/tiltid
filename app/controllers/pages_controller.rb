class PagesController < ApplicationController
  def home
  end

  def about
  end

  def youtube_downloader
  end

  def download_youtube
    video_url = params[:video_url]

    audio_directory = Rails.root.join('tmp/audio')
    Dir.mkdir(audio_directory) unless File.directory?(audio_directory)

    yt_dlp_command = "yt-dlp -x --audio-format mp3 -o '#{audio_directory}/%(title)s.%(ext)s' #{video_url}"
    system(yt_dlp_command)
    download_path = `#{yt_dlp_command} --get-filename`.strip
    ext = File.extname(download_path)
    audio_file_path = download_path.gsub(ext, '.mp3')

    if File.exist?(audio_file_path)
      # Send the MP3 file to the user for download
      new_filename = audio_file_path.gsub(' ', '-')

      # Rename the file
      File.rename(File.join(audio_file_path), File.join(new_filename))
      if File.exist?(new_filename)
        flash[:success] = 'yay!'
        send_file new_filename, type: 'audio/mpeg', filename: File.basename(new_filename), disposition: 'attachment'
      end
    else
      flash[:error] = 'Failed to download the video.'
      redirect_to pages_youtube_downloader_path
    end
  end
end
