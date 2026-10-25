class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.57/mopm-0.0.57-macos-arm64.tar.gz"
      sha256 "80dc4f519e5c27186737eb4c141cea92ca8aeabba0ffade04dc87caaba56ce62"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.57/mopm-0.0.57-linux-aarch64.tar.gz"
      sha256 "407a175fea46f5d4d5ef776d26acb1aecaff3c0e87a20ee64d4e61f1a8126548"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.57/mopm-0.0.57-linux-x86_64.tar.gz"
      sha256 "3ce36096a1090ca2fde8986e0dd3e16c3ed97cdd5d6a9d970474c487476e77f7"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
