class Tierstore < Formula
  desc "S3 server over a hot and a cold tier of S3-compatible stores"
  homepage "https://tierstore.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.139/tierstore-0.3.139-macos-arm64.tar.gz"
      sha256 "e201a6d48202f886da1c2678110b5954401fc0bb85868ca45fa730f2f2452ae1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.139/tierstore-0.3.139-linux-aarch64.tar.gz"
      sha256 "0576441928b09b618ed3a0a2b5336b1028450f29be3e8922fb2cb470cca64b04"
    end
    on_intel do
      url "https://github.com/komira-ai/tierstore/releases/download/v0.3.139/tierstore-0.3.139-linux-x86_64.tar.gz"
      sha256 "ee4775afdb957773134d3b867e799650b9e62dfc2da9edd81b7e8493d2607d13"
    end
  end

  def install
    bin.install "tierstore"
  end

  test do
    assert_match "tierstore #{version}", shell_output("#{bin}/tierstore --version")
  end
end
