class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.145/tierstore-0.3.145-macos-arm64.tar.gz"
      sha256 "91b1e63537f1eab1c73a8a5cae3903fcd79145dbe6a37799a3ece569fdcc1688"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.145/tierstore-0.3.145-linux-aarch64.tar.gz"
      sha256 "cb2c4ee5c770adba01d16bb589a9cb1d1eadd6c9251a9837d8247616abe0dc81"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.145/tierstore-0.3.145-linux-x86_64.tar.gz"
      sha256 "9e63fce015ce2a8a31ef0494071f0efc7572bb19c8285d4ceeebe6ef141d1bbd"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
