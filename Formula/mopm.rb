class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.93/mopm-0.0.93-macos-arm64.tar.gz"
      sha256 "0dfd05d145b0c3da44cebb45b17f64f7686f4db9031dd056287d825f3f93c750"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.93/mopm-0.0.93-linux-aarch64.tar.gz"
      sha256 "96706eb44814df7a5a93ae0ce798ef677fada2ac06854234d5af01748440d2f4"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.93/mopm-0.0.93-linux-x86_64.tar.gz"
      sha256 "f405f2afdcdfe115819a28f14388b68e4ab38ed25513e3b68770f0c331425402"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
