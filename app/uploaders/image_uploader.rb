class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  #include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

    if Rails.env.production?
      storage :fog
    else
      storage :file
    end


  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

 
  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_whitelist
      %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
   def filename
    if original_filename.present?
        time = Time.now
        name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
        name.downcase
    end
   end
end
