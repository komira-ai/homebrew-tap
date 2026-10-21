class Mopm < Formula
  desc "Package manager for Mojo"
  homepage "https://mopm.dev"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.19/mopm-0.0.19-macos-arm64.tar.gz"
      sha256 "f8a4fde6881e0bdf3586217c2b705a53825b5fb2669e17a270ad668ebfe09cd4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.19/mopm-0.0.19-linux-aarch64.tar.gz"
      sha256 "c2c3ab62c9e2416d8d8ce98be94ff2e819a601b7901a086c4f4977816ad8d052"
    end
    on_intel do
      url "https://github.com/komira-ai/mopm/releases/download/v0.0.19/mopm-0.0.19-linux-x86_64.tar.gz"
      sha256 "9c8cf20069f2ce8701d70a5f3850a95c922e060900bfe4ca68fc1d5caa8bfa22"
    end
  end

  def install
    bin.install "mopm"
  end

  test do
    assert_match "mopm #{version}", shell_output("#{bin}/mopm --version")
  end
end
