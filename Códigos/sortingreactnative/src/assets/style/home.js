import {StyleSheet} from 'react-native';

export default StyleSheet.create({
  content: {
    padding: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
  },
  content2: {
    paddingHorizontal: 20,
    paddingBottom: 20,
    justifyContent: 'center', // Eixo primário (Y)
    alignItems: 'center', // Eixo secundário (X)
  },
  img: {
    width: 90,
    height: 90,
    flexDirection: 'row',
    flex: 1,
  },
  title: {
    fontWeight: 'bold',
    fontSize: 17,
    textAlign: 'center',
  },
  subtitle: {
    fontSize: 17,
    textAlign: 'center',
    marginTop: 30,
    marginBottom: 10,
  },
  algorithm: {
    marginTop: -20,
    paddingLeft: 20,
  },
  button: {
    backgroundColor: '#f1641f',
    padding: 18,
    borderRadius: 10,
    alignSelf: 'stretch',
    marginTop: 30,
    marginBottom: 10,
  },
  buttonText: {
    textAlign: 'center',
    color: '#ffffff',
    fontSize: 17,
    fontWeight: 'bold',
  },
  buttonAbout: {
    fontSize: 17,
    color: '#f1641f',
  },
});
