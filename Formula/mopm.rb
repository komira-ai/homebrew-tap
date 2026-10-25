class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.48/mopm-0.0.48-macos-arm64.tar.gz"
      sha256 "03793a82ab8c09a33319da8e2d8d0c217a4cdbe929a4f8f54b8ea230369af9ec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.48/mopm-0.0.48-linux-aarch64.tar.gz"
      sha256 "c54f8ca1de69b2f0b333c9a3deab9a0248702f2210a1eb854a7f6381ef94730d"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.48/mopm-0.0.48-linux-x86_64.tar.gz"
      sha256 "fac4cb0156bb649f7149cb94962adb81470d9a92bcc4ab3b45e2943c3f11c2b4"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
