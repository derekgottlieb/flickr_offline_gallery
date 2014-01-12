require 'spec_helper'

module FlickrOfflineGallery
  describe PhotoSize do

    subject!(:size) {
      VCR.use_cassette('photo_sizes') do
        described_class.new(FlickrAPI.get_photo_sizes("10440808526")[2])
      end
    }

    it "should should know its label" do
      size.label.should == "Thumbnail"
    end

    it "should should know its height" do
      size.height.should == "75"
    end

    it "should should know its width" do
      size.width.should == "100"
    end

    it "should should know its url" do
      size.source.should == "http://farm8.staticflickr.com/7402/10440808526_c3fd515635_t.jpg"
    end

    it 'should know its filename friendly key' do
      size.key.should == "thumbnail"
    end
  end
end