module RotatingBannersHelper

  URL_ASSOCIATED_WITH_IMAGE = {
    :obshee_delo_plakati => '/txt/plakati/',
    :nashi_knigi_vzhivuyu => '/txt/biblioteka-konzeptualnih-znaniy/nashi-knigi-vzhivuyu/',
    :konceptualnie_futbolki => '/txt/konceptualnie-futbolki/',
    :nashi_sayti => '/txt/nashi-sayti/'
  }
  IMAGE_FILE_TYPES = %w( .jpg .gif .png )

  def random_image
    @files ||= Dir.entries(
                           "#{Rails.root}/public/images/obyavleniya").delete_if { |x|
      !IMAGE_FILE_TYPES.index(x[-4,4])
    }
    
    file = @files[rand(@files.length)];
    @files.delete file
    
    return "/images/obyavleniya/#{file}"
  end

  def url_associated_with_image(image_file_name)
    URL_ASSOCIATED_WITH_IMAGE[File.basename(image_file_name, '.*').to_sym]
  end

  def random_banner
    image_path = random_image
    link_to image_tag(image_path), url_associated_with_image(image_path)
  end  

  def banner_collection
    small_banners ||= Dir.entries(
                                  "#{Rails.root}/public/images/obyavleniya/small").delete_if { |x|
      !IMAGE_FILE_TYPES.index(x[-4,4])
    }
    output = ''
    small_banners.each do |small_banner|
      output += link_to image_tag("/images/obyavleniya/small/#{small_banner}"), root_path
    end if small_banners.length > 2
    output
  end
end
