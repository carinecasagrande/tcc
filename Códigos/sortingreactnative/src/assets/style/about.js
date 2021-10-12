import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  content: {
    padding: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
  },
  title: {
    fontWeight: 'bold',
    fontSize: 20,
    textAlign: 'center',
    marginTop: 10,
  },
  subtitle: {
    fontSize: 20,
    textAlign: 'center',
    marginTop: 40,
  },
  titlePaperwork: {
    fontWeight: 'bold',
    fontSize: 20,
    textAlign: 'center',
    marginTop: 40,
  },
  subtitlePaperwork: {
    fontSize: 20,
    textAlign: 'center',
  },
  description: {
    marginTop: 40,
    fontSize: 20,
    textAlign: 'justify',
    marginLeft: 50,
  },
  location: {
    textAlign: 'center',
    marginTop: 40,
    fontSize: 20,
  },
  button: {
    backgroundColor: '#f1641f',
    padding: 18,
    borderRadius: 10,
    alignSelf: 'stretch',
    marginTop: 20,
    marginBottom: 10,
  },
  buttonText: {
    textAlign: 'center',
    color: '#ffffff',
    fontSize: 20,
    fontWeight: 'bold',
  },
});
